package mediator {

import robotlegs.bender.bundles.mvcs.Mediator;

import signal.UserLoginedSignal;
import signal.UserLogoutSignal;

import view.MainView;

public class MainViewMediator extends Mediator{

    [Inject]
    public var mainView:MainView;

    [Inject]
    public var loginSignal:UserLoginedSignal;

    [Inject]
    public var logoutSignal:UserLogoutSignal;

    public override function initialize():void {
        loginSignal.add(login);
        logoutSignal.add(logout)
    }

    private function login():void {
        mainView.showHomePage()
    }

    private function logout():void {
        mainView.showLoginPage()
    }
}
}
