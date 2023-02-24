//
//  ServicesManager.swift
//  moviesProgramatically
//
//  Created by Mac on 19/02/23.
//

import Foundation

class ServicesManager: NSObject {
    
    func getListMovies(completionHandler:@escaping(FavoriteMoviesListResponse?,Int?,Error?)->Void){
        let urlString = "\(MoviesValues.shared.initialPath)account/\(MoviesValues.shared.userName)/favorite/movies?"
        if var urlComponents = URLComponents(string: urlString) {
            urlComponents.queryItems = [
                URLQueryItem(name: "api_key", value: MoviesValues.shared.apiKey),
                URLQueryItem(name: "session_id", value: MoviesValues.shared.sesionID),
                URLQueryItem(name: "language", value: "es-MX"),
                URLQueryItem(name: "sort_by", value: "created_at.asc"),
                URLQueryItem(name: "page", value: "1"),
            ]
            if let urlObject = urlComponents.url {
                var urlRequest = URLRequest(url: urlObject)
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
                let task = URLSession.shared.dataTask(with: urlRequest) { responseData, responseCode, responseError in
                    if let auxResponse = responseCode as? HTTPURLResponse {
                        let auxResponseCode = auxResponse.statusCode
                    }
                    guard let respuestaDiferente = responseData else {
                        completionHandler(nil, responseCode.hashValue, responseError)
                        return
                    }
                    if let json = try? JSONDecoder().decode(FavoriteMoviesListResponse.self, from: respuestaDiferente){
                        completionHandler(json,200,nil)
                    }
                    
                }
                task.resume()
            }
        }
    }
    public var currentId = 0
    func deleteFavorite(completionHandler:@escaping(PeliculaLogin?,Int?,Error?)->Void){
        let urlString = "\(MoviesValues.shared.initialPath)account/\(MoviesValues.shared.userName)/favorite?api_key=\(MoviesValues.shared.apiKey)&session_id=\(MoviesValues.shared.sesionID)"
        
        if let urlObject = URL(string: urlString){
            var urlRequest = URLRequest(url: urlObject)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpMethod = "POST"
            let body: [String: Any] = [
                "media_type": "movie",
                "media_id": currentId,
                "favorite": false
            ]
            
            guard let httpBody = try? JSONSerialization.data(withJSONObject: body, options: []) else {
                completionHandler(nil, nil, "error al convertir el json" as! Error)
                return
            }
            
            urlRequest.httpBody = httpBody
                
                let task = URLSession.shared.dataTask(with: urlRequest) { responseData, responseCode, responseError in
                    if let auxResponse = responseCode as? HTTPURLResponse {
                        let auxResponseCode = auxResponse.statusCode
                    }
                    guard let respuestaDiferente = responseData else {
                        completionHandler(nil, responseCode.hashValue, responseError)
                        return
                    }
                    if let json = try? JSONDecoder().decode(PeliculaLogin.self, from: respuestaDiferente){
                        completionHandler(json,200,nil)
                    }
                    
                }
                task.resume()
            }
        }
    }
