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
    func notifyError(error: String) {
        
    }
    func showLoading() {
        movies_ActivityIndicator.show(parent: self.view)
    }
    
    func dissmissLoading() {
        DispatchQueue.main.async {
            movies_ActivityIndicator.remove(parent: self.view)
        }
    }
}

extension movies_HomeView: movies_HomeViewUIDelegate {
    func notifyUserAndPassword(name: String, password: String) {
        self.presenter?.requestUserAndPassword(name: name, password: password)
    }
    
    
}
