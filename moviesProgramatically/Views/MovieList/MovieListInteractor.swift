//
//  MovieListInteractor.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation

class MovieListInteractor{
    var presenter: MovieListPresenterProtocol?
}

extension MovieListInteractor: MovieListInteractorProtocol {
    
    func fetchMovieList(gender: moviesCategories) {
        let urlString = "\(MoviesValues.shared.initialPath)movie/\(gender)"
        if var urlComponents = URLComponents(string: urlString) {
            urlComponents.queryItems = [
                URLQueryItem(name: "api_key", value: MoviesValues.shared.apiKey),
                URLQueryItem(name: "language", value: "es-MX")
            ]
            if let urlObject = urlComponents.url {
                var urlRequest = URLRequest(url: urlObject)
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.httpMethod = "GET"
                let task = URLSession.shared.dataTask(with: urlRequest) { responseData, responseCode, responseError in
                    if let respuestaDiferente = responseData {
                        if let data = try? JSONDecoder().decode(MoviesListResponse.self, from: respuestaDiferente){
                            if let movieList = data.results {
                                DispatchQueue.main.async {
                                    self.presenter?.responseMovieList(movieList)
                                }
                            }
                        }
                    }
                    if let respuestaError = responseError {
                        DispatchQueue.main.async {
                            self.presenter?.responseError(error: "\(respuestaError)", step: .initialList)
                        }
                        return
                    }
                }
                task.resume()
            }
        }
    }
    
    func fetchFavoriteMovie(movieId: Int) {
        let urlString = "\(MoviesValues.shared.initialPath)account/\(MoviesValues.shared.userName)/favorite?api_key=\(MoviesValues.shared.apiKey)&session_id=\(MoviesValues.shared.sesionID)"
        
        if let urlObject = URL(string: urlString){
            var urlRequest = URLRequest(url: urlObject)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpMethod = "POST"
            let body: [String: Any] = [
                "media_type": "movie",
                "media_id": movieId,
                "favorite": true
            ]
            
            guard let httpBody = try? JSONSerialization.data(withJSONObject: body, options: []) else {
                self.presenter?.responseError(error: "Failed to create JSON body", step: .addingFavorite)
                return
            }
            
            urlRequest.httpBody = httpBody
            
            let task =  URLSession.shared.dataTask(with: urlRequest) { responseData, responseCode, responseError in
                if let respuestaDiferente = responseData {
                    if let data = try? JSONDecoder().decode(PeliculaLogin.self, from: respuestaDiferente){
                        if let success = data.success {
                            DispatchQueue.main.async {
                                if success == true {
                                    self.presenter?.responseFavoriteMovie()
                                }
                                else {
                                    if let error = data.status_message {
                                        self.presenter?.responseError(error: error, step: .addingFavorite)
                                    }
                                }
                            }
                        }
                    }
                }
                if let respuestaError = responseError {
                    DispatchQueue.main.async {
                        self.presenter?.responseError(error: "\(respuestaError)", step: .addingFavorite)
                    }
                    return
                }
            }
            task.resume()
        }
    }
}
