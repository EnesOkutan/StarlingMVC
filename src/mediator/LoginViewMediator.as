package mediator {

import flash.utils.setTimeout;
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
        eventMap.mapListener(eventDispatcher, LoginEvent.BLOCK_USER, onBlockUser);
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

    private function onBlockUser(event:LoginEvent):void {
        loginView.disableForm()
        setTimeout(function ():void {
            loginView.enableForm();
        }, userModel.blockTime);
    }

}
}
