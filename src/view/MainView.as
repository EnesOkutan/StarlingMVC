package view {

import starling.display.Sprite;
import starling.events.Event;

public class MainView extends Sprite{

    private var loginView:LoginView;
    private var homeView:HomeView;

    public function MainView()
    {
        super()

        loginView = new LoginView();
        homeView = new HomeView();

        addEventListener(Event.ADDED_TO_STAGE, init);
    }

    private function init(event:Event):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, init)
        showLoginPage();
    }

    public function showLoginPage():void {
        homeView.removeFromParent();
        addChild(loginView)
    }

    public function showHomePage():void {
        loginView.removeFromParent()
        addChild(homeView)
    }

}
}
