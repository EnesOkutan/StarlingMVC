package mediator {
import event.SignOutEvent;

import model.UserModel;

import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

import starling.events.Event;

import view.HomeView;

public class HomeViewMediator extends StarlingMediator {

    [Inject]
    public var model:UserModel;

    [Inject]
    public var mainView:HomeView;

    public override function initialize():void {
        mainView.addEventListener("logout", submitLogout)
    }

    private function submitLogout(event:Event):void {
        eventDispatcher.dispatchEvent(new SignOutEvent())
    }

}
}
