//
//  MovieListViewUI.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation
import UIKit

protocol MovieListViewUIDelegate {
    
}

class MovieListViewUI: UIView{
    var delegate: MovieListViewUIDelegate?
    var navigationController: UINavigationController?
    public var movieList: [Pelicula]?
    private var firstURL:String = "https://image.tmdb.org/t/p/w500"
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 30) / 2, height: 320)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(movies_GeneralMoviesListViewCell.self, forCellWithReuseIdentifier: movies_GeneralMoviesListViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
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
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI(){
        self.addSubview(collectionView)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
extension MovieListViewUI: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movies_GeneralMoviesListViewCell.identifier, for: indexPath) as! movies_GeneralMoviesListViewCell
        if let list = movieList?[indexPath.row] {
            cell.titleLabel.text = list.title
            if let url = URL(string: firstURL + list.urlPic! ?? "") {
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
            
        }
        return cell
    }
}
