//
//  MovieListView.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation
import UIKit

public enum ListService {
    case initialList
}

class MovieListView: UIViewController {
    var presenter: MovieListPresenterProtocol?
    private var ui: MovieListViewUI?
    private var currentStep: ListService = .initialList
    
    internal var titleNavigation = "Peliculas" {
        didSet {
            self.navigationItem.title = titleNavigation
        }
    }
    
    override func loadView() {
        ui = MovieListViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        self.navigationItem.title = titleNavigation
        view = ui
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.requestMovieList()
    }
    
    private func retryService(){
        switch currentStep {
        case .initialList:
            self.presenter?.requestMovieList()
        }
    }
}

extension MovieListView: MovieListViewProtocol {
    func notifyError(error: String, step: ListService) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Reintentar", style: .default, handler: { action in
            self.retryService()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showLoading() {
        movies_ActivityIndicator.show(parent: self.view)
    }
    
    func dissmissLoading() {
        movies_ActivityIndicator.remove(parent: self.view)
    }
    
    func notifyMovieList(list: [Pelicula]) {
        self.ui?.movieList = list
        self.ui?.collectionView.reloadData()
        self.ui?.collectionView.layoutIfNeeded()
    }
    
    
}

extension MovieListView: MovieListViewUIDelegate {
    
}
