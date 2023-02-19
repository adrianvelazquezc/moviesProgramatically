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
    private var tempName = ""
    private var tempPassword = ""
    
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
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Reintentar", style: .default, handler: { action in
            self.presenter?.requestUserAndPassword(name: self.tempName, password: self.tempPassword)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func showLoading() {
        movies_ActivityIndicator.show(parent: self.view)
    }
    
    func dissmissLoading() {
        movies_ActivityIndicator.remove(parent: self.view)
    }
}

extension movies_HomeView: movies_HomeViewUIDelegate {
    func notifyUserAndPassword(name: String, password: String) {
        self.tempName = name
        self.tempPassword = password
        self.presenter?.requestUserAndPassword(name: name, password: password)
    }
    
    
}
