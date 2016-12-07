//
//  RoutingProtocol.swift
//  VIPER Generics
//
//  Created by Alejo on 12/7/16.
//  Copyright © 2016 gapps. All rights reserved.
//

import UIKit

protocol RoutingProtocolBase: class {
    associatedtype InteractorType: InteractorProtocolBase
    associatedtype PresenterType: PresenterProtocolBase
    associatedtype ViewControllerType: ViewControllerProtocolBase
    
    weak var viewController: ViewControllerType! {get set}
    weak var interactor: InteractorType! {get set}
    weak var presenter: PresenterType! {get set}
    
    //function for loading the view
    func loadView() -> ViewControllerType
    
    //extra config executed after the viewControllerConfigured()
    func extraConfigViewController()
    
    static func buildViewController() throws -> ViewControllerType
    
    init()
}

extension RoutingProtocolBase{
    
    func viewControllerConfigured() throws -> ViewControllerType{
        
        let newViewController = loadView()
        let newPresenter = PresenterType()
        let newInteractor = InteractorType()
        
        presenter = newPresenter
        interactor = newInteractor
        viewController = newViewController
        
        if let newInteractor = newInteractor as? PresenterType.InteractorType{
            presenter.interactor = newInteractor
        } else {
            throw RoutingProtocolError.wrongInteractorProtocolPresenter
        }
        if let viewController = viewController as? PresenterType.ViewControllerType{
            presenter.viewController = viewController
        } else {
            
            throw RoutingProtocolError.wrongViewProtocolPresenter
        }
        if let selfRouting = self as? PresenterType.RoutingType {
            presenter.routing = selfRouting
        } else {
            throw RoutingProtocolError.wrongRoutingProtocolPresenter
        }
        
        
        if let presenter = presenter as? InteractorType.PresenterType{
            interactor.presenter = presenter
        } else {
            throw RoutingProtocolError.wrongPresenterProtocolInteractor
        }
        
        if let presenter = presenter as? ViewControllerType.PresenterType {
            viewController.presenter = presenter
        } else {
            throw RoutingProtocolError.wrongPresenterProtocolView
        }
        
        self.extraConfigViewController()
        
        return viewController
        
    }
    func presentScene(router: Self, animated: Bool = true, completition: (() -> Void)?) throws {
        guard let viewController = try viewControllerConfigured() as? UIViewController else {
            return
        }
        if let routerController = router.viewController as? UIViewController{
            routerController.present(viewController, animated: animated, completion: completition)
        }
    }
    
    func loadFromWindow(window: UIWindow) throws{
        if let controller = try self.viewControllerConfigured() as? UIViewController{
            window.rootViewController = controller
        }
        
    }
    func extraConfigViewController() {
        //optional function
    }
    static func buildViewController() throws -> ViewControllerType{
        let routing = Self.init()
        return try routing.viewControllerConfigured()
    }
}

enum RoutingProtocolError: Error {
    case wrongInteractorProtocolPresenter
    case wrongViewProtocolPresenter
    case wrongPresenterProtocolInteractor
    case wrongPresenterProtocolView
    case wrongRoutingProtocolPresenter
}

protocol ViewProtocolPresenterBase: class {
}


protocol ViewControllerProtocolBase: ViewProtocolPresenterBase {
    associatedtype PresenterType = PresenterProtocolViewBase
    var presenter:PresenterType! {get set}
}

protocol PresenterProtocolViewBase: class {
    
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    func viewDidLoad()
}
extension PresenterProtocolViewBase {
    func viewWillAppear(){}
    func viewDidAppear(){}
    func viewWillDisappear(){}
    func viewDidDisappear(){}
    func viewDidLoad(){}
}
protocol PresenterProtocolInteractorBase: class {
}
protocol PresenterProtocolBase: PresenterProtocolViewBase,PresenterProtocolInteractorBase {
    associatedtype InteractorType //= protocol<InteractorProtocolPresenterBase>
    associatedtype ViewControllerType //= protocol<ViewProtocolPresenterBase>
    associatedtype RoutingType
    
    var viewController: ViewControllerType? {get set}
    var interactor: InteractorType! {get set}
    var routing: RoutingType! {get set}
    init()
}

protocol InteractorProtocolPresenterBase: class {
}
protocol InteractorProtocolBase:InteractorProtocolPresenterBase {
    associatedtype PresenterType = PresenterProtocolInteractorBase
    
    var presenter:PresenterType? {get set}
    init()
}

