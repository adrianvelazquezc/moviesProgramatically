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
    public var userID = ""
    public var sesionID = "102be39b19425434cc3aa69cd2427e58d9294973"
    public var initialPath = "https://api.themoviedb.org/3/"
    public var firstURL:String = "https://image.tmdb.org/t/p/w500"
}
