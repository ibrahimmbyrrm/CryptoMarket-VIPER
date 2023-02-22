//
//  Router.swift
//  VIPER-Design-Pattern
//
//  Created by İbrahim Bayram on 22.02.2023.
//

import Foundation
import UIKit
//Class , Protocol
//Entry Point
typealias EntryPoint = UIViewController & AnyView

protocol AnyRouter {
    var entry : EntryPoint? {get}
    static func startExecution() -> AnyRouter
}

class CryptoRouter : AnyRouter {
    var entry: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        var view : AnyView = CryptoView()
        var presenter : AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = CryptoInteractor()
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint    
        
        return router
    }
    
    
}
