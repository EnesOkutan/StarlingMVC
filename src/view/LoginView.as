package view {

import feathers.controls.Alert;
import feathers.controls.Button;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.controls.TextInput;
import feathers.data.ArrayCollection;
import feathers.layout.VerticalLayout;
import feathers.themes.MetalWorksMobileTheme;

import org.osflash.signals.Signal;

import starling.display.Sprite;
import starling.events.Event;

public class LoginView extends Sprite{

    public var loginSignal:Signal = new Signal(String, String);

    private var usernameInput:TextInput;
    private var passwordInput:TextInput;
    private var submitButton:Button;
    private var alert:Alert;

    public function LoginView(){

        new MetalWorksMobileTheme();

        super();

        var layout:VerticalLayout = new VerticalLayout();
        layout.paddingTop = 100.0;
        layout.paddingRight = 20.0;
        layout.paddingBottom = 20.0;
        layout.paddingLeft = 20.0;
        layout.gap = 10.0;

        var container:LayoutGroup = new LayoutGroup();
        container.layout = layout;
        this.addChild( container );

        var usernameLabel:Label = new Label();
        usernameLabel.text = "User Name";
        container.addChild(usernameLabel);

        this.usernameInput = new TextInput();
        this.usernameInput.width = 275
        container.addChild(this.usernameInput);

        var passwordLabel:Label = new Label();
        passwordLabel.text = "Password";
        container.addChild(passwordLabel);

        this.passwordInput = new TextInput();
        this.passwordInput.displayAsPassword = true;
        this.passwordInput.width = 275
        container.addChild(this.passwordInput);

        this.submitButton = new Button();
        this.submitButton.label = "Login";
        this.submitButton.width = 275
        this.submitButton.addEventListener(Event.TRIGGERED, submitLogin);
        container.addChild(this.submitButton);

    }
    
    private function submitLogin(event:Event):void {
        loginSignal.dispatch(usernameInput.text, passwordInput.text)
    }

    public function showAlert():void {
        alert = Alert.show( "Username or password is invalid", "Invalid Credentials", new ArrayCollection(
                [
                    { label: "OK", triggered: disposeAlert }
                ]), null, false, false, customAlertFactory );
    }

    private function disposeAlert():void {
        this.alert.removeFromParent(true)
    }

    public function customAlertFactory():Alert
    {
        var alert:Alert = new Alert();
        alert.x = 50
        alert.y = 70
        alert.width = 220
        alert.height = 250
        return alert;
    }


}
}
