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
    func requestMovieList(gender: moviesCategories) {
        self.view?.showLoading()
        self.interactor?.fetchMovieList(gender: gender)
    }
    
    func responseMovieList(_ list: [Pelicula]) {
        self.view?.dissmissLoading()
        view?.notifyMovieList(list: list)
    }
    
    func responseError(error: String, step: ListService) {
        self.view?.dissmissLoading()
        view?.notifyError(error: error, step: step)
    }
    
    
}
