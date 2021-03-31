package {

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import command.UserLoginCommand;
import command.UserLogoutCommand;

import event.SignInEvent;
import event.SignOutEvent;

import mediator.LoginViewMediator;
import mediator.HomeViewMediator;
import mediator.MainViewMediator;

import service.UserService;
import model.UserModel;

import signal.UserErrorSignal;
import signal.UserLoginedSignal;
import signal.UserLogoutSignal;

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

    [Inject]
    public var contextView:ContextView;

    public function configure():void
    {
        //Map mediators
        mediatorMap.map(MainView).toMediator(MainViewMediator);
        mediatorMap.map(LoginView).toMediator(LoginViewMediator);
        mediatorMap.map(HomeView).toMediator(HomeViewMediator);

        //Map commands
        commandMap.map(SignInEvent.SIGN_IN).toCommand(UserLoginCommand);
        commandMap.map(SignOutEvent.SIGN_OUT).toCommand(UserLogoutCommand);

        //Inject models
        injector.map(UserModel).asSingleton();

        //Inject as3 signals
        injector.map(UserLoginedSignal).asSingleton();
        injector.map(UserLogoutSignal).asSingleton();
        injector.map(UserErrorSignal).asSingleton();

        //Inject services
        injector.map(UserService).asSingleton();

    }

}
}
