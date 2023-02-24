//
//  movies_HomeEntity.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import UIKit

struct PeliculaToken: Codable{
    let success: Bool?
    let token: String?
    
    enum CodingKeys: String, CodingKey{
        case success = "success"
        case token = "request_token"
    }
}
struct PeliculaLogin: Codable{
    let success: Bool?
    let status_message: String?
    
    enum CodingKeys: String, CodingKey{
        case success = "success"
        case status_message = "status_message"
    }
}

struct PeliculaSession: Codable{
    let success: Bool?
    let session_id: String?
    
    enum CodingKeys: String, CodingKey{
        case success = "success"
        case session_id = "session_id"
    }
}
