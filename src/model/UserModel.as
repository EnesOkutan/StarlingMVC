package model {
import flash.events.IEventDispatcher;

import signal.UserLoginedSignal;
import signal.UserLogoutSignal;

public class UserModel {

    [Inject]
    public var eventDispatch:IEventDispatcher;

    [Inject]
    public var loginSignal:UserLoginedSignal;

    [Inject]
    public var logoutSignal:UserLogoutSignal;

    public var username:String = "username";
    public var password:String = "password";
    public var signed:Boolean;

    [PostConstruct]
    public function mapSignalListeners():void {
        loginSignal.add(login);
        logoutSignal.add(logout);
    }

    private function login():void {
        this.signed = true;
    }

    private function logout():void {
        this.signed = false;
    }

}
}
