package {

import command.LoginFailCommand;

import event.LoginEvent;

import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import mediator.LoginViewMediator;
import mediator.HomeViewMediator;
import mediator.MainViewMediator;

import service.UserService;
import model.UserModel;

import view.LoginView;
import view.HomeView;
import view.MainView;

public class AppConfig implements IConfig {

    [Inject]
    public var injector:IInjector;

    [Inject]
    public var mediatorMap:IMediatorMap;

    [Inject]
    public var commandMap:IEventCommandMap;

    public function configure():void
    {
        //Map mediators
        mediatorMap.map(MainView).toMediator(MainViewMediator);
        mediatorMap.map(LoginView).toMediator(LoginViewMediator);
        mediatorMap.map(HomeView).toMediator(HomeViewMediator);

        //Inject models
        injector.map(UserModel).asSingleton();

        //Inject services
        injector.map(UserService).asSingleton();

        //Command mapping
        commandMap.map(LoginEvent.LOGIN_FAIL).toCommand(LoginFailCommand);

    }

}
}
