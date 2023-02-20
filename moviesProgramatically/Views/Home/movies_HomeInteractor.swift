//
//  movies_HomeInteractor.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation

class movies_HomeInteractor{
    var presenter: movies_HomePresenterProtocol?
}

extension movies_HomeInteractor: movies_HomeInteractorProtocol {
    func fetchToken(name: String, password: String) {
        let urlString = "\(MoviesValues.shared.initialPath)authentication/token/new?api_key=\(MoviesValues.shared.apiKey)"
        if let urlObject = URL(string: urlString){
            var urlRequest = URLRequest(url: urlObject)
            urlRequest.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: urlRequest) { responseData, responseCode, responseError in
                if let respuestaDiferente = responseData {
                    if let data = try? JSONDecoder().decode(PeliculaToken.self, from: respuestaDiferente){
                        if let token = data.token {
                            
                            MoviesValues.shared.userID = token
                            self.fetchUserAndPassword(name: name, password: password)
                        }
                    }
                }
                if let respuestaError = responseError {
                    self.presenter?.responseError(error: "\(respuestaError)")
                    return
                }
            }
            task.resume()
        }
    }
    
    func fetchUserAndPassword(name: String, password: String) {
        let urlString = "\(MoviesValues.shared.initialPath)authentication/token/validate_with_login?api_key=\(MoviesValues.shared.apiKey)"
        if let urlObject = URL(string: urlString){
            var urlRequest = URLRequest(url: urlObject)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpMethod = "POST"
            let body: [String: String] = [
                "username": name,
                "password": password,
                "request_token": MoviesValues.shared.userID
            ]
            
            guard let httpBody = try? JSONSerialization.data(withJSONObject: body, options: []) else {
                self.presenter?.responseError(error: "Failed to create JSON body")
                return
            }
            
            urlRequest.httpBody = httpBody
            
            let task =  URLSession.shared.dataTask(with: urlRequest) { responseData, responseCode, responseError in
                if let respuestaDiferente = responseData {
                    if let data = try? JSONDecoder().decode(PeliculaLogin.self, from: respuestaDiferente){
                        if let success = data.success {
                            DispatchQueue.main.async {
                                if success == true {
                                    MoviesValues.shared.userName = name
                                    self.presenter?.responseUserAndPassword()
                                }
                                else {
                                    if let error = data.status_message {
                                        self.presenter?.responseError(error: error)
                                    }
                                }
                            }
                        }
                    }
                }
                if let respuestaError = responseError {
                    DispatchQueue.main.async {
                        self.presenter?.responseError(error: "\(respuestaError)")
                    }
                    return
                }
            }
            task.resume()
        }
    }
}
