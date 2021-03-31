package command {

import event.SignInEvent;

import robotlegs.bender.bundles.mvcs.Command;

import service.UserService;

public class UserLoginCommand extends Command{

    [Inject]
    public var signInEvent:SignInEvent;

    [Inject]
    public var service:UserService;

    public override function execute():void {
        this.service.login(signInEvent.username, signInEvent.password);
    }
}
}
