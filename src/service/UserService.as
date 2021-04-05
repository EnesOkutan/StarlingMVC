package service {

import event.LoginEvent;
import util.Dispatcher;

public class UserService extends Dispatcher {


    public function login(username:String, password:String):Boolean {
        return username == "enes" && password == "123456";
    }

    public function logout():Boolean {
        return true
    }

    public function blockUser():void {
        dispatch(new LoginEvent(LoginEvent.BLOCK_USER));
    }
}
}
