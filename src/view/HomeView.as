package view {
import feathers.controls.Alert;
import feathers.controls.Button;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.data.ArrayCollection;
import feathers.layout.VerticalLayout;
import feathers.themes.MetalWorksMobileTheme;

import starling.display.Sprite;
import starling.events.Event;

public class HomeView extends Sprite {

    private var button:Button;
    private var alert:Alert;

    public function HomeView() {

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
        usernameLabel.text = "This is a Main Page";
        container.addChild(usernameLabel);

        this.button = new Button();
        this.button.label = "Logout";
        this.button.width = 275
        this.button.addEventListener(Event.TRIGGERED, showModal);
        container.addChild(this.button);
    }

    private function showModal(event:Event):void {
        alert = Alert.show( "Are you sure you want to log out?", "Warning", new ArrayCollection(
                [
                    { label: "Yes", triggered: submitLogout },
                    { label: "No", triggered: disposeAlert }
                ]), null, false, false, customAlertFactory );
    }

    private function submitLogout():void {
        dispatchEvent(new Event("logout"));
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
    };
}
}
