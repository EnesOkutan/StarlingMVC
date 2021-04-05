package model {

import flash.events.IEventDispatcher;

import service.UserService;
import event.LoginEvent;

public class UserModel {

    [Inject]
    public var eventDispatch:IEventDispatcher;

    [Inject]
    public var userService:UserService;

    public var username:String;
    public var password:String;
    public var signed:Boolean;
    public var invalidLoginCount:int;
    public var blockTime:int = 10000;

    public function login(username:String, password:String):void {
        if (userService.login(username, password)) {
            this.signed = true;
            this.username = username;
            this.password = password;
            eventDispatch.dispatchEvent(new LoginEvent(LoginEvent.LOGIN_SUCCESSFUL));
        } else {
            eventDispatch.dispatchEvent(new LoginEvent(LoginEvent.LOGIN_FAIL));
        }
    }

    public function logout():void {
        if (userService.logout()) {
            this.signed = false;
            eventDispatch.dispatchEvent(new LoginEvent(LoginEvent.LOGOUT_SUCCESSFUL));
        }
    }

}
}
