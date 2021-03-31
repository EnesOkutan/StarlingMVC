package command {

import robotlegs.bender.bundles.mvcs.Command;

import service.UserService;

public class UserLogoutCommand extends Command{

    [Inject]
    public var service:UserService;

    public override function execute():void
    {
        this.service.logout();
    }

}
}
