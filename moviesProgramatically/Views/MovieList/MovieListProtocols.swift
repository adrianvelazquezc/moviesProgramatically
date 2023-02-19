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
}

protocol MovieListInteractorProtocol: AnyObject {
    func fetchMovieList()
}

protocol MovieListPresenterProtocol: AnyObject {
    func requestMovieList()
    func responseMovieList(_ list: [Pelicula])
    func responseError(error: String, step: ListService)
}

protocol MovieListRouterProtocol: AnyObject {
    
}
