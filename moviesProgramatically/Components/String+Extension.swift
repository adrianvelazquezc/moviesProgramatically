//
//  String+Extension.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import UIKit

public func getDecorativeTitleText(text: String, color: UIColor = .black) -> NSMutableAttributedString {
    
    let multipleAttributes: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.foregroundColor: color,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30.0)]
    
    let attributedString = NSMutableAttributedString(string: text, attributes: multipleAttributes)
    
    return attributedString
}
