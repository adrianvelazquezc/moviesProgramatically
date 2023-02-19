//
//  MovieListView.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation
import UIKit

class MovieListView: UIViewController {
    var presenter: MovieListPresenterProtocol?
    private var ui: MovieListViewUI?
    
    override func loadView() {
        ui = MovieListViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
}

extension MovieListView: MovieListViewProtocol {
    
}

extension MovieListView: MovieListViewUIDelegate {
    
}
