//
//  String+Extension.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import UIKit

public func getDecorativeTitleText(text: String, color: UIColor = .black, font: UIFont = .systemFont(ofSize: 30, weight: .bold)) -> NSMutableAttributedString {
    
    let multipleAttributes: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.foregroundColor: color,
        NSAttributedString.Key.font: font
    ]
    
    let attributedString = NSMutableAttributedString(string: text, attributes: multipleAttributes)
    
    return attributedString
}
public func parseDate(_ str : String, oldDateFormat: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = oldDateFormat
    
    let date = dateFormatter.date(from: str) ?? Date()
        dateFormatter.dateFormat = "MMM d, yyyy"
        let formattedDate = dateFormatter.string(from: date)
    return formattedDate
}
