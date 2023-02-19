//
//  movies_HomeRouter.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation
import UIKit

class movies_HomeRouter{
    var navigation: UINavigationController?
}

extension movies_HomeRouter: movies_HomeRouterProtocol{
    func navigateToNextView() {
        if let navigationController = self.navigation{
            DispatchQueue.main.async {
                let vc = MovieListMain.createModule(navigation: navigationController)
                navigationController.pushViewController(vc, animated: true )
            }
        }
    }
    
    
}
