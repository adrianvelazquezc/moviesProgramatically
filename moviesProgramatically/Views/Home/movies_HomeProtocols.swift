//
//  movies_HomeProtocols.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation

protocol movies_HomeViewProtocol: AnyObject {
    func notifyError(error: String)
}

protocol movies_HomeInteractorProtocol: AnyObject {
    func fetchToken(name: String, password: String)
    func fetchUserAndPassword(name: String, password: String, tempToken: String)
}

protocol movies_HomePresenterProtocol: AnyObject {
    func requestUserAndPassword(name: String, password: String)
    func responseUserAndPassword()
    func responseError(error: String)
}

protocol movies_HomeRouterProtocol: AnyObject {
    func navigateToNextView()
}
