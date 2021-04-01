package event {
import flash.events.Event;

public class LoginEvent extends Event{

    public static const LOGIN:String = "LoginEvent/LOGIN";
    public static const LOGIN_SUCCESSFUL:String = "LoginEvent/LOGIN_SUCCESSFUL";
    public static const LOGIN_FAIL:String = "LoginEvent/LOGIN_FAIL";

    public static const LOGOUT:String = "LoginEvent/LOGOUT";
    public static const LOGOUT_SUCCESSFUL:String = "LoginEvent/LOGOUT_SUCCESSFUL";

    public var args:Object;
    public var extras:Object;

    public function LoginEvent(event:String) {
        super(event);
    }
}
}
