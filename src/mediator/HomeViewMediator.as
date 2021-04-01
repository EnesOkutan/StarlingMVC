package mediator {

import robotlegs.bender.bundles.mvcs.Mediator;

import view.HomeView;
import model.UserModel;

public class HomeViewMediator extends Mediator {

    [Inject]
    public var userModel:UserModel;

    [Inject]
    public var homeView:HomeView;

    public override function initialize():void {
        homeView.logoutSignal.add(onLogout)
    }

    public override function destroy():void {
        eventMap.unmapListeners();
        homeView.logoutSignal.removeAll();
    }

    private function onLogout():void {
        userModel.logout();
    }

}
}
