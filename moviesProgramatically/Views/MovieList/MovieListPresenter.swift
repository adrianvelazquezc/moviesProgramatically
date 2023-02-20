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
    func requestFavoriteMovie(movieId: Int) {
        self.view?.showLoading()
        self.interactor?.fetchFavoriteMovie(movieId: movieId)
    }
    
    func responseFavoriteMovie() {
        self.view?.dissmissLoading()
        view?.successFavoriteAdded()
    }
    
    func requestMovieList(gender: moviesCategories) {
        self.view?.showLoading()
        //se agrego un pequenio delay, para que se aprecie el loader
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.interactor?.fetchMovieList(gender: gender)
    })
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
