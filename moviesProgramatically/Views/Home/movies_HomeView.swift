//
//  movies_HomeView.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation
import UIKit

class movies_HomeView: UIViewController {
    var presenter: movies_HomePresenterProtocol?
    private var ui: movies_HomeViewUI?
    
    override func loadView() {
        ui = movies_HomeViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
}

extension movies_HomeView: movies_HomeViewProtocol {
    
}

extension movies_HomeView: movies_HomeViewUIDelegate {
    
}
