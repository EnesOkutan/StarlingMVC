package mediator {

import robotlegs.bender.bundles.mvcs.Mediator;

import view.MainView;
import event.LoginEvent;

public class MainViewMediator extends Mediator{

    [Inject]
    public var mainView:MainView;

    public override function initialize():void {
        eventMap.mapListener(eventDispatcher, LoginEvent.LOGIN_SUCCESSFUL, onLoginSuccessful);
        eventMap.mapListener(eventDispatcher, LoginEvent.LOGOUT_SUCCESSFUL, onLogoutSuccessful);
    }

    public override function destroy():void {
        eventMap.unmapListeners();
    }

    private function onLoginSuccessful(event:LoginEvent):void {
        mainView.showHomePage()
    }

    private function onLogoutSuccessful(event:LoginEvent):void {
        mainView.showLoginPage()
    }
}
}
