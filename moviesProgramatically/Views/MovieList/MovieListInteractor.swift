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
    
    func fetchMovieList(){
        let urlString = "https://api.themoviedb.org/3/movie/popular"
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

}
