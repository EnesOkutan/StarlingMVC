package mediator {

import robotlegs.bender.bundles.mvcs.Mediator;

import model.UserModel;
import view.LoginView;
import event.LoginEvent;

public class LoginViewMediator extends Mediator {

    [Inject]
    public var userModel:UserModel;

    [Inject]
    public var loginView:LoginView;

    public override function initialize():void {
        eventMap.mapListener(eventDispatcher, LoginEvent.LOGIN_FAIL, onLoginError);
        loginView.loginSignal.add(onLogin);
    }

    public override function destroy():void {
        eventMap.unmapListeners();
        loginView.loginSignal.removeAll()
    }

    private function onLoginError(event:LoginEvent):void {
        loginView.showAlert();
    }

    private function onLogin(username:String, password:String):void {
        userModel.login(username, password)
    }

}
}
