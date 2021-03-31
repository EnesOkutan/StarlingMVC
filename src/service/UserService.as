package service {

import model.UserModel;

import signal.UserErrorSignal;
import signal.UserLoginedSignal;
import signal.UserLogoutSignal;

public class UserService {

    [Inject]
    public var userModel:UserModel;

    [Inject]
    public var loginSignal:UserLoginedSignal;

    [Inject]
    public var errorSignal:UserErrorSignal;

    [Inject]
    public var logoutSignal:UserLogoutSignal;

    public function login(username:String, password:String):void {
        if (username == userModel.username && password == userModel.password) {
            userModel.signed = true
            loginSignal.dispatch();
        } else {
            userModel.signed = false
            errorSignal.dispatch()
        }
    }

    public function logout():void {
        userModel.signed = false
        logoutSignal.dispatch()
    }
}
}
