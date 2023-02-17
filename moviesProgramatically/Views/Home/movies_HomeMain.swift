//
//  movies_HomeMain.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation
import UIKit

open class movies_HomeMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: movies_HomeView? = movies_HomeView()
        if let view = viewController {
            let presenter = movies_HomePresenter()
            let router = movies_HomeRouter()
            let interactor = movies_HomeInteractor()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            
            router.navigation = navigation
            
            interactor.presenter = presenter
            return view
        }
        return UIViewController()
    }
}
