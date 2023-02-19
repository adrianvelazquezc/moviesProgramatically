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
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case title = "title"
        case urlPic = "poster_path"
        case date = "release_date"
        case over = "overview"
    }
}

public struct moviesCategories {
    public var latest = ""
    public var nowPlaying = ""
    public var popular = ""
    public var topRated = ""
    public var upcoming = ""
}
