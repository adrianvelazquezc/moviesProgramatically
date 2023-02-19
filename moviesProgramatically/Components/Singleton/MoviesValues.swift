//
//  MoviesValues.swift
//  moviesProgramatically
//
//  Created by Mac on 19/02/23.
//

import Foundation

open class MoviesValues {
    
    public static let shared = MoviesValues()
    
    
    public var flags: moviesCategories = moviesCategories()
    public var apiKey = "e142ca6d5b52024931683472e1abbef2"
}
