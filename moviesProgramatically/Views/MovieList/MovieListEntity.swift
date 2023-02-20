//
//  MovieListEntity.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation

struct MoviesListResponse: Codable {
    let page: Int?
    let results: [Pelicula]?
    let total_pages: Int?
    let total_results: Int?
    
}
struct Pelicula: Codable{
    let id: Int?
    let title: String?
    let urlPic: String?
    let date: String?
    let over: String?
    let average: Float?
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case title = "title"
        case urlPic = "poster_path"
        case date = "release_date"
        case over = "overview"
        case average = "vote_average"
    }
}

public enum moviesCategories {
    case popular
    case top_rated
    case upcoming
}

struct postFavoriteResponse: Codable{
    let success: Bool?
    
    enum CodingKeys: String, CodingKey{
        case success = "success"
    }
}
