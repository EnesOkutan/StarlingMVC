package service {

public class UserService {

    public function login(username:String, password:String):Boolean {
        return username == "enes" && password == "123456";
    }

    public function logout():Boolean {
        return true
    }
}
}
