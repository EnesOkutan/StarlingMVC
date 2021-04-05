package command {
import model.UserModel;

import robotlegs.bender.bundles.mvcs.Command;

import service.UserService;

public class LoginFailCommand extends Command{

    [Inject]
    public var userModel:UserModel;

    [Inject]
    public var userService:UserService;

    public static var maxLoginCount:int = 3;

    public override function execute():void {
        userModel.invalidLoginCount += 1
        if (userModel.invalidLoginCount >= maxLoginCount) {
            userModel.invalidLoginCount = 0;
            this.userService.blockUser();
        }
    }

}
}
