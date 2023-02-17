//
//  movies_HomePresenter.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation

class movies_HomePresenter {
    var interactor: movies_HomeInteractorProtocol?
    weak var view: movies_HomeViewProtocol?
    var router: movies_HomeRouterProtocol?
}



extension movies_HomePresenter: movies_HomePresenterProtocol {
    
}
