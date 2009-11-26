package 
{
	import fl.controls.NumericStepper;
	import fl.controls.TextInput;
	import flash.display.Sprite;
	import flash.events.Event;
	import myLables;
	import fl.controls.Label;
	import fl.controls.Button;
	import fl.controls.List;
	
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	import fl.data.DataProvider;
	
	
	import com.example.programmingas3.playlist.PlayList;
	import com.example.programmingas3.playlist.Song;
	import com.example.programmingas3.playlist.SortProperty;
	
	/**
	 * ...
	 * @author xdsnet
	 */
	public class Main extends Sprite 
	{
		private var sortTitle:Label = new Label();
		private var genreTitle:Label = new Label();
		private var formTitle:Label = new Label();
		private var sortByTitle:Button = new Button();
		private var sortByArtist:Button = new Button();
		private var sortByYear:Button = new Button();
		private var showAddControlsBtn:Button = new Button();
		private var submitSongData:Button = new Button();
		private var songList:List = new List();
		private var newSongGenres:List = new List();
		private var newSongYear:NumericStepper = new NumericStepper();
		private var newSongTitle:TextInput = new TextInput();
		private var newSongArtist:TextInput = new TextInput();
		private var newSongFilename:TextInput = new TextInput();
		
		private var ADD_SONG:uint = 1;
		private var SONG_DETAIL:uint = 2;
		private var playList:PlayList = new PlayList();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function buju():void
		{
			addChild(myLables.getALable("PlayList例子", 14, 11, 511.9, 25.9, "center", true, 18, 0x0));
			addChild(myLables.getALable("ActionScript 3.0: 关于数组的处理", 15, 38, 511.9, 18.5, "center", false, 12, 0x0));
			addChild(myLables.getALable("标题：", 16, 254.3, 94, 16.2, "right", false, 11, 0x0));
			addChild(myLables.getALable("演唱者：", 16, 283.3, 94, 16.2, "right", false, 11, 0x0));
			addChild(myLables.getALable("年代：", 16, 313.4, 94, 16.2, "right", false, 11, 0x0));
			addChild(myLables.getALable("文件名：", 16, 342.3, 94, 16.2, "right", false, 11, 0x0));
			
			sortTitle.x = 17.9;
			sortTitle.y = 67.3
			sortTitle.width = 72;
			sortTitle.height = 22;
			sortTitle.text = "排序依据";
			addChild(sortTitle);
			
			sortByTitle.x = 98.3;
			sortByTitle.y = 67.3;
			sortByTitle.width = 65;
			sortByTitle.height = 22;
			sortByTitle.label = "标题";
			addChild(sortByTitle);
			
			sortByArtist.x = 172.3;
			sortByArtist.y = 67.3;
			sortByArtist.width = 60;
			sortByArtist.height = 22;
			sortByArtist.label = "专辑";
			addChild(sortByArtist);
			
			sortByYear.x = 241.3;
			sortByYear.y = 67.3;
			sortByYear.width = 60;
			sortByYear.height = 22;
			sortByYear.label = "年代";
			addChild(sortByYear);
			
			showAddControlsBtn.x = 441.9;
			showAddControlsBtn.y = 67.3;
			showAddControlsBtn.width = 84;
			showAddControlsBtn.height = 22;
			showAddControlsBtn.label = "新歌曲";
			addChild(showAddControlsBtn);
			
			formTitle.x = 13.8;
			formTitle.y = 219.3;
			formTitle.width = 259.9;
			formTitle.height = 22;
			formTitle.text = "添加新歌曲";
			addChild(formTitle);
			
			genreTitle.x = 425.9;
			genreTitle.y = 219.3;
			genreTitle.width = 100.1;
			genreTitle.height = 22;
			genreTitle.text = "流派:";
			addChild(genreTitle);
			
			songList.x = 13.5;
			songList.y = 101.3;
			songList.width = 511.9;
			songList.height = 113;
			addChild(songList);
			
			newSongGenres.x = 425.9;
			newSongGenres.y = 251.3;
			newSongGenres.width = 100;
			newSongGenres.height = 108;
			addChild(newSongGenres);
			
			newSongYear.x = 123.3;
			newSongYear.y = 310.4;
			newSongYear.width = 80;
			newSongYear.height = 22;
			newSongYear.maximum = 2006;
			newSongYear.minimum = 1400;
			newSongYear.stepSize = 1;
			newSongYear.value = 2006;
			addChild(newSongYear);
			
			submitSongData.x = 301.3;
			submitSongData.y = 366.3;
			submitSongData.width = 97;
			submitSongData.height = 22;
			submitSongData.label = "添加新歌曲";
			addChild(submitSongData);
			
			newSongTitle.x = 123.3;
			newSongTitle.y = 251.3;
			newSongTitle.width = 180.9;
			newSongTitle.height = 22;
			addChild(newSongTitle);
			
			newSongArtist.x = 123.3;
			newSongArtist.y = 280.3;
			newSongArtist.width = 180.9;
			newSongArtist.height = 22;
			addChild(newSongArtist);
			
			newSongFilename.x = 123.3;
			newSongFilename.y = 339.3;
			newSongFilename.width = 180.9;
			newSongFilename.height = 22;
			addChild(newSongFilename);
		}
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			buju();
			
			setFormState(ADD_SONG);

			// prepopulate the list with a few songs				
			playList.addSong(new Song("Nessun Dorma", "Luciano Pavarotti", 1990, "nessundorma.mp3", ["90's", "Opera"]));
			playList.addSong(new Song("Come Undone", "Duran Duran", 1993, "comeundone.mp3", ["90's", "Pop"]));
			playList.addSong(new Song("Think of Me", "Sarah Brightman", 1987, "thinkofme.mp3", ["Showtunes"]));
			playList.addSong(new Song("Unbelievable", "EMF", 1991, "unbelievable.mp3", ["90's", "Pop"]));

			songList.dataProvider = new DataProvider(playList.songList);
			
			sortByTitle.addEventListener(MouseEvent.CLICK, buttonListener);
			sortByArtist.addEventListener(MouseEvent.CLICK, buttonListener);
			sortByYear.addEventListener(MouseEvent.CLICK, buttonListener);
			showAddControlsBtn.addEventListener(MouseEvent.CLICK, buttonListener);
			submitSongData.addEventListener(MouseEvent.CLICK, addNewSong);
			songList.addEventListener(Event.CHANGE, songSelectionChange);
			songList.labelFunction = songListLabel;

			var tf:TextFormat = new TextFormat();
			tf.font = "Verdana";
			tf.bold = true;
			tf.size = 16;
			sortTitle.setStyle("textFormat",tf);
			formTitle.setStyle("textFormat",tf);
			genreTitle.setStyle("textFormat", tf);
			
			var genres:Array = [ "90's" , "Classical", "Country", "Hip-hop", "Opera", "Pop", "Rock", "Showtunes" ];
			//var genres:Array = new Array();
			newSongGenres.allowMultipleSelection = true;
			var dp:DataProvider = new DataProvider(genres);
			newSongGenres.dataProvider = dp;
		}
		private function sortList(sortField:SortProperty):void
		{
			// Make all the sort type buttons enabled.
			// The active one will be grayed-out below
			sortByTitle.selected = false;
			sortByArtist.selected = false;
			sortByYear.selected = false;

			switch (sortField)
			{
				case SortProperty.TITLE:
					sortByTitle.selected = true;
					break;
				case SortProperty.ARTIST:
					sortByArtist.selected = true;
					break;
				case SortProperty.YEAR:
					sortByYear.selected = true;
					break;
			}

			playList.sortList(sortField);
			
			refreshList();
		}


		private function refreshList():void
		{
			// remember which song was selected
			var selectedSong:Song = Song(songList.selectedItem);
			
			// re-assign the song list as the dataprovider to get the newly sorted list
			// and force the List control to refresh itself
			songList.dataProvider = new DataProvider(playList.songList);
			
			// reset the song selection
			if (selectedSong != null)
			{
				songList.selectedItem = selectedSong;
			}
		}


		private function songSelectionChange(e:Event):void
		{
			if (songList.selectedIndex != -1)
			{
				setFormState(SONG_DETAIL);
			}
			else
			{
				setFormState(ADD_SONG);
			}
		}
		
		//*
		private function initString(inArray:Array):Array //用于修正原始例子中的处理数组时的错误
		{
			var outStrings:Array =[];
			var l:uint=inArray.length;
			for (var i:uint=0;i<l;i++)
			{
				outStrings.push(inArray[i].data);
			}
			return outStrings;
		}

		//*/

		private function addNewSong(e:MouseEvent):void
		{
			// gather the values from the form and add the new song
			var title:String = newSongTitle.text;
			var artist:String = newSongArtist.text;
			var year:uint = newSongYear.value;
			var filename:String = newSongFilename.text;
			
			playList.addSong(new Song(title, artist, year, filename, initString(newSongGenres.selectedItems)));

			refreshList();

			// clear out the "add song" form fields
			setFormState(ADD_SONG);
		}

		private function songListLabel(item:Object):String
		{
			return item.toString();
		}


		private function setFormState(state:uint):void
		{
			// set the form title and control state
			switch (state)
			{
				case ADD_SONG:
					formTitle.text = "添加新歌曲";
					// show the submit button
					submitSongData.visible = true;
					showAddControlsBtn.visible = false;
					// clear the form fields
					newSongTitle.text = "";
					newSongArtist.text = "";
					newSongYear.value = (new Date()).fullYear;
					newSongFilename.text = "";
					newSongGenres.selectedIndex = -1;
					// deselect the currently selected song (if any)
					songList.selectedIndex = -1;
					break;
					
				case SONG_DETAIL:
					formTitle.text = "歌曲资料";
					// populate the form with the selected item's data
					var selectedSong:Song = Song(songList.selectedItem);
					newSongTitle.text = selectedSong.title;
					newSongArtist.text = selectedSong.artist;
					newSongYear.value = selectedSong.year;
					newSongFilename.text = selectedSong.filename;
					newSongGenres.selectedItems = selectedSong.genres;
					// hide the submit button
					submitSongData.visible = false;
					showAddControlsBtn.visible = true;
					break;
			}
		}
		private function buttonListener(e:MouseEvent):void 
		{
			var buttonClicked:Button = e.target as Button;
			switch(buttonClicked) {
				case sortByTitle:
					sortList(SortProperty.TITLE);
					break;
				case sortByArtist:
					sortList(SortProperty.ARTIST);
					break;
				case sortByYear:
					sortList(SortProperty.YEAR);
					break;
				case showAddControlsBtn:
					setFormState(ADD_SONG);
					break;
			}
		}
	}
	
}