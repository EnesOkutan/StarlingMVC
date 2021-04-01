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

    public function login(username:String, password:String):void {
        this.signed = true;
        if (userService.login(username, password)) {
            this.username = username;
            this.password = password;
            eventDispatch.dispatchEvent(new LoginEvent(LoginEvent.LOGIN_SUCCESSFUL));
        } else {
            eventDispatch.dispatchEvent(new LoginEvent(LoginEvent.LOGIN_FAIL));
        }
    }

    public function logout():void {
        this.signed = false;
        if (userService.logout()) {
            eventDispatch.dispatchEvent(new LoginEvent(LoginEvent.LOGOUT_SUCCESSFUL));
        }
    }

}
}
