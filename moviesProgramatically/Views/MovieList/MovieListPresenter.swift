//
//  MovieListPresenter.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation

class MovieListPresenter {
    var interactor: MovieListInteractorProtocol?
    weak var view: MovieListViewProtocol?
    var router: MovieListRouterProtocol?
}



extension MovieListPresenter: MovieListPresenterProtocol {
    
}
