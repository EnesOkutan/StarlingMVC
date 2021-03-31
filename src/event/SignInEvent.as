package event {
import flash.events.Event;

public class SignInEvent extends Event{

    public static const SIGN_IN:String = "SIGN_IN";

    public var username:String;
    public var password:String;

    public function SignInEvent(username:String, password:String) {
        this.username = username;
        this.password = password;
        super(SIGN_IN)
    }

    public override function clone():Event {
        return new SignInEvent(username, password);
    }

}
}
