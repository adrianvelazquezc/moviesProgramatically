//
//  MoviesValues.swift
//  moviesProgramatically
//
//  Created by Mac on 19/02/23.
//

import Foundation

open class MoviesValues {
    
    public static let shared = MoviesValues()
    
    public var apiKey = "e142ca6d5b52024931683472e1abbef2"
    public var userName = ""
    public var request_token = ""
    public var sesionID = ""
    public var initialPath = "https://api.themoviedb.org/3/"
    public var firstURL:String = "https://image.tmdb.org/t/p/w500"
}
