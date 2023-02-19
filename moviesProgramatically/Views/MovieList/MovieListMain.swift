//
//  MovieListMain.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation
import UIKit

open class MovieListMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: MovieListView? = MovieListView()
        if let view = viewController {
            let presenter = MovieListPresenter()
            let router = MovieListRouter()
            let interactor = MovieListInteractor()
            
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
