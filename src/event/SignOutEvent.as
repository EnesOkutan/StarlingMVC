package event {
import flash.events.Event;

public class SignOutEvent extends Event{

    public static const SIGN_OUT:String = "SIGN_OUT";

    public function SignOutEvent() {
        super(SIGN_OUT)
    }

    public override function clone():Event {
        return new SignOutEvent();
    }

}
}
