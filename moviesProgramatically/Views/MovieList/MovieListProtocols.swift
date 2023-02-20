//
//  MovieListProtocols.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation

protocol MovieListViewProtocol: AnyObject {
    func notifyError(error: String, step: ListService)
    func showLoading()
    func dissmissLoading()
    func notifyMovieList(list: [Pelicula])
    func successFavoriteAdded()
}

protocol MovieListInteractorProtocol: AnyObject {
    func fetchMovieList(gender: moviesCategories)
    func fetchFavoriteMovie(movieId: Int)
}

protocol MovieListPresenterProtocol: AnyObject {
    func requestMovieList(gender: moviesCategories)
    func responseMovieList(_ list: [Pelicula])
    func responseError(error: String, step: ListService)
    
    func requestFavoriteMovie(movieId: Int)
    func responseFavoriteMovie()
}

protocol MovieListRouterProtocol: AnyObject {
    
}
