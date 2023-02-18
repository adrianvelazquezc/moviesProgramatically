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
        let urlString = "https://api.themoviedb.org/3/authentication/token/new?api_key=e142ca6d5b52024931683472e1abbef2"
        if let urlObject = URL(string: urlString){
            var urlRequest = URLRequest(url: urlObject)
            urlRequest.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: urlRequest) { responseData, responseCode, responseError in
                if let respuestaDiferente = responseData {
                    if let data = try? JSONDecoder().decode(PeliculaToken.self, from: respuestaDiferente){
                        if let token = data.token {
                            self.fetchUserAndPassword(name: name, password: password, tempToken: token)
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
    
    func fetchUserAndPassword(name: String, password: String, tempToken: String) {
        let urlString = "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=e142ca6d5b52024931683472e1abbef2"
        if let urlObject = URL(string: urlString){
            var urlRequest = URLRequest(url: urlObject)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpMethod = "POST"
            print(tempToken)
            let body: [String: String] = [
                "username": "adrianvelazquezc",
                "password": "sU.!JEBT.j.S4Ru",
                "request_token": "6d37df5e103621a5d147121eb147dda75e5319d2"
            ]
            
            guard let httpBody = try? JSONSerialization.data(withJSONObject: body, options: []) else {
                self.presenter?.responseError(error: "Failed to create JSON body")
                return
            }
            
            urlRequest.httpBody = httpBody
            
            let task =  URLSession.shared.dataTask(with: urlRequest) { responseData, responseCode, responseError in
                    if let auxResponse = responseCode as? HTTPURLResponse {
                        let auxResponseCode = auxResponse.statusCode
                        print(auxResponse.statusCode)
                    }
                if let respuestaDiferente = responseData {
                    if let data = try? JSONDecoder().decode(PeliculaLogin.self, from: respuestaDiferente){
                        if let success = data.success {
                            print(data.status_message)
                            print(success)
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
}
