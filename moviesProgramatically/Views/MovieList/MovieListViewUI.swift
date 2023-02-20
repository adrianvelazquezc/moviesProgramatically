//
//  MovieListViewUI.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation
import UIKit

protocol MovieListViewUIDelegate {
    func notifyGenderSelected()
    func notifyMenuPressed()
    func notifyAddFavorite(movieId: Int)
}

class MovieListViewUI: UIView{
    var delegate: MovieListViewUIDelegate?
    
    var navigationController: UINavigationController?
    public var movieList: [Pelicula]?
    public var valueSelected: moviesCategories = .popular
    public var currendMovieId = 0
    
    lazy private var navigationBar: movies_NavigationBar = {
        let navigationBar = movies_NavigationBar()
        navigationBar.buildComponents(titleText: "TV Shows", delegate: self)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        return navigationBar
    }()
    
    lazy private var moviesSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.removeAllSegments()
        
        for (index, value) in ["Popular", "Top Rated", "Upcoming"].enumerated() {
            control.insertSegment(withTitle: value, at: index, animated: true)
        }
        let font = UIFont.systemFont(ofSize: 16)
        control.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        control.backgroundColor = .clear
        control.selectedSegmentIndex = 0
        let normalAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: font
        ]
        control.setTitleTextAttributes(normalAttributes, for: .normal)
        control.selectedSegmentTintColor = .lightGray
        control.addTarget(self, action: #selector(movieValueSelectedChanged(_:)), for: .valueChanged)
        return control
    }()
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 10) / 2, height: 340)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(movies_GeneralMoviesListViewCell.self, forCellWithReuseIdentifier: movies_GeneralMoviesListViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor =  #colorLiteral(red: 0.03991495073, green: 0.08235343546, blue: 0.1102337912, alpha: 1)
        return collectionView
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: MovieListViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            setUI()
            setConstraints()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor =  #colorLiteral(red: 0.03991495073, green: 0.08235343546, blue: 0.1102337912, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI(){
        self.addSubview(navigationBar)
        self.addSubview(moviesSegmentedControl)
        self.addSubview(collectionView)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            moviesSegmentedControl.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 15),
            moviesSegmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            moviesSegmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            collectionView.topAnchor.constraint(equalTo: moviesSegmentedControl.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    private func changeValues() {
        movieList = nil
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
    }
    
    @objc func movieValueSelectedChanged(_ sender: UISegmentedControl) {
        switch moviesSegmentedControl.selectedSegmentIndex {
        case 0:
            valueSelected = .popular
        case 1:
            valueSelected = .top_rated
        case 2:
            valueSelected = .upcoming
        default:
            valueSelected = .popular
        }
        changeValues()
        delegate?.notifyGenderSelected()
    }
}
extension MovieListViewUI: UICollectionViewDelegate, UICollectionViewDataSource {
    func favoriteTapped(movieID: Int) {
        print(movieID)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movies_GeneralMoviesListViewCell.identifier, for: indexPath) as! movies_GeneralMoviesListViewCell
        if let list = movieList?[indexPath.row] {
            //imagen
            if let url = URL(string: MoviesValues.shared.firstURL + list.urlPic! ?? "") {
                let session = URLSession.shared
                let task = session.dataTask(with: url) { (data, response, error) in
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            cell.posterPicture.image = image
                        }
                    }
                }
                task.resume()
            }
            //titulo
            cell.titleLabel.text = list.title
            //fecha
            cell.dateLabel.text = parseDate(list.date ?? "", oldDateFormat: "yyyy-MM-dd")
            //promedio
            if let averange = list.average {
                cell.averangeLabel.text = "\(averange)"
            }
            //resenia
            cell.resumeLabel.text = list.over
            
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let newId = movieList?[indexPath.row].id {
            currendMovieId = newId
            self.delegate?.notifyAddFavorite(movieId: newId)
        }
    }
}

extension MovieListViewUI: movies_NavigationBarDelegate{
    func buttonTapped() {
        delegate?.notifyMenuPressed()
    }
}

//extension MovieListViewUI: movies_MoviesListDelegate{
//    func favoriteTapped(movieID: Int) {
//        print(movieID)
//    }
//}
