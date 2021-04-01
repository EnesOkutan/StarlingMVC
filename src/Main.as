package {

import flash.display.Sprite;
import flash.events.Event;

import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.framework.impl.Context;
import robotlegs.extensions.starlingViewMap.StarlingViewMapExtension;

import starling.core.Starling;

import view.MainView;

[SWF(frameRate=60, width=640, height=960)]
public class Main extends Sprite {

    public function Main()
    {

        super();

        addEventListener(Event.ADDED_TO_STAGE, init)
    }

    private function init(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, init);

        var starling:Starling = new Starling(MainView, stage);
        starling.start();

        var context:Context = new Context();
        context.install(MVCSBundle, StarlingViewMapExtension);
        context.configure(AppConfig, starling);
        context.configure(new ContextView(this));
        context.initialize();
    }

}
}
