package mediator {

import event.SignInEvent;
import starling.events.Event;
import robotlegs.bender.bundles.mvcs.Mediator;

import signal.UserErrorSignal;
import signal.UserLoginedSignal;
import model.UserModel;
import view.LoginView;

public class LoginViewMediator extends Mediator {

    [Inject]
    public var model:UserModel;

    [Inject]
    public var loginView:LoginView;

    [Inject]
    public var loginSignal:UserLoginedSignal;

    [Inject]
    public var errorSignal:UserErrorSignal;

    public override function initialize():void {
        loginView.addEventListener("login", submitLogin);
        errorSignal.add(errorLogin)
    }

    private function errorLogin():void {
        loginView.showAlert();
    }

    private function submitLogin(event:Event):void {
        eventDispatcher.dispatchEvent(new SignInEvent(loginView.getUsername(), loginView.getPassword()))
    }

}
}
