//
//  UILoader.swift
//  AceptaPagoBaz
//
//  Created by David on 29/04/20.
//  Copyright © 2020 Zeus. All rights reserved.
//

import UIKit

open class movies_ActivityIndicator {
    
    private static let tagView = -123456789
    
    private static var movieIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.tintColor = .gray
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    public static func show(parent: UIView) {
        parent.endEditing(true)
        if parent.viewWithTag(tagView) != nil {
            return
        }
        parent.isUserInteractionEnabled = false
        let mainView = UIView(frame: (parent.frame))
        mainView.backgroundColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1221039245)
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mainView.tag = tagView
        
        mainView.addSubview(movieIndicator)
        parent.addSubview(mainView)
        movieIndicator.startAnimating()
        
            NSLayoutConstraint.activate([
                movieIndicator.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
                movieIndicator.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
                movieIndicator.heightAnchor.constraint(equalToConstant: 50),
                movieIndicator.widthAnchor.constraint(equalToConstant: 50),
            ])
    }
    
    public static func remove(parent: UIView) {
        parent.endEditing(true)
        parent.isUserInteractionEnabled = true
        if let loaderView = parent.viewWithTag(tagView) {
            loaderView.removeFromSuperview()
        }
        movieIndicator.stopAnimating()
    }
}
