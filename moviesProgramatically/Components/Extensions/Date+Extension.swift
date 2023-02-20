//
//  Date+Extension.swift
//  moviesProgramatically
//
//  Created by Mac on 19/02/23.
//

import Foundation

public func parseDate(_ str : String, oldDateFormat: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = oldDateFormat
    
    let date = dateFormatter.date(from: str) ?? Date()
        dateFormatter.dateFormat = "MMM d, yyyy"
        let formattedDate = dateFormatter.string(from: date)
    return formattedDate
}
