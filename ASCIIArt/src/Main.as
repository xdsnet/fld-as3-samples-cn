package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import fl.containers.UILoader;
	import fl.controls.TextArea;
	import fl.controls.Button;
	import com.example.programmingas3.asciiArt.ImageInfo;
	import com.example.programmingas3.asciiArt.AsciiArtBuilder;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import fl.controls.Label;
	/**
	 * ...
	 * @author xdsnet
	 */
	public class Main extends Sprite 
	{
		private var uiLoader:UILoader;
		private var asciiArtText:TextArea;
		private var nextImageBtn:Button;
		private var asciiArt:AsciiArtBuilder;
		private var tf:TextFormat;
		private var sourceImage:Label;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			addChild(myLables.getALable("ASCII Art 例子",14,11,929.3,25.9,"center",true,18,0xff0000));
			addChild(myLables.getALable("ActionScript 3.0: 关于字符串的处理",15,38,928.3,18.5,"center",false,12,0x0));
			
			uiLoader = new UILoader();
			uiLoader.x = 18;
			uiLoader.y = 113.3;
			uiLoader.width = 400;
			uiLoader.height = 300;
			addChild(uiLoader);
			
			asciiArtText = new TextArea();
			asciiArtText.x = 434.4;
			asciiArtText.y = 73.3;
			asciiArtText.width = 510;
			asciiArtText.height = 450;
			addChild(asciiArtText);
			
			nextImageBtn = new Button();
			nextImageBtn.label = "下一图";
			nextImageBtn.x = 318;
			nextImageBtn.y = 424.4;
			nextImageBtn.width = 100;
			nextImageBtn.height = 22;
			addChild(nextImageBtn);
			
			sourceImage = new Label();
			sourceImage.x = 17.7;
			sourceImage.y = 424.4;
			sourceImage.width = 287.1;
			sourceImage.height = 22;
			addChild(sourceImage);
			
			asciiArt = new AsciiArtBuilder();
			asciiArt.addEventListener("ready", imageReady);
			
			nextImageBtn.addEventListener(MouseEvent.CLICK, nextImage);
			tf = new TextFormat();
			tf.font = "_typewriter";
			tf.size = 8;
			asciiArtText.setStyle("textFormat",tf);
		}
		
		private function imageReady(event:Event):void
		{
			updatePreview();
		}


		/**
		 * Called when the "next image" button is pressed.
		 */
		private function nextImage(e:MouseEvent):void
		{
			// Advance to the next image
			asciiArt.next();
			// update the image preview
			updatePreview();
		}


		/**
		 * Updates the image preview display, including title and image, using
		 * the current image in the asciiArt object.
		 */
		private function updatePreview():void
		{
			var imageInfo:ImageInfo = asciiArt.currentImage.info;
			uiLoader.load(new URLRequest(AsciiArtBuilder.IMAGE_PATH + imageInfo.fileName));
			sourceImage.text = imageInfo.title;
			asciiArtText.text = asciiArt.asciiArtText;
		}
	}
	
}