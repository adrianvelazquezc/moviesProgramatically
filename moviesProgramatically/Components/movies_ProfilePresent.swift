//
//  movies_ProfilePresent.swift
//  moviesProgramatically
//
//  Created by Mac on 19/02/23.
//

import UIKit

class movies_ProfilePresent: UIViewController {
    
    public var movieList: [Pelicula]?
    let serviceManager: ServicesManager = ServicesManager()
    
    private lazy var mainContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = getDecorativeTitleText(text: "Perfil", color:  #colorLiteral(red: 0.4548825622, green: 0.8329617977, blue: 0.4634124041, alpha: 1))
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var profilePicture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "profileIcon")
        image.clipsToBounds = true
        return image
    }()
    
    public lazy var profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "@\(MoviesValues.shared.userName)"
        label.textColor =  #colorLiteral(red: 0.4548825622, green: 0.8329617977, blue: 0.4634124041, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var favoriteLabel: UILabel = {
        let label = UILabel()
        label.text = "Peliculas Favoritas"
        label.textColor =  #colorLiteral(red: 0.4548825622, green: 0.8329617977, blue: 0.4634124041, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 10) / 1.8, height: UIScreen.main.bounds.height < 667 ? (UIScreen.main.bounds.height / 2.0) : 340)
//                                    (UIScreen.main.bounds.height) / 2.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(movies_GeneralMoviesListViewCell.self, forCellWithReuseIdentifier: movies_GeneralMoviesListViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor =  #colorLiteral(red: 0.03991495073, green: 0.08235343546, blue: 0.1102337912, alpha: 1)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setConstraints()
        loadService()
    }
    
    func setUI(){
        view.backgroundColor =  #colorLiteral(red: 0.03991495073, green: 0.08235343546, blue: 0.1102337912, alpha: 1)
        view.addSubview(mainContainer)
        mainContainer.addSubview(titleLabel)
        mainContainer.addSubview(profilePicture)
        mainContainer.addSubview(profileNameLabel)
        mainContainer.addSubview(favoriteLabel)
        mainContainer.addSubview(collectionView)
    }
    
    func setConstraints(){
        if UIScreen.main.bounds.height == 667 {
            
                NSLayoutConstraint.activate([
                    mainContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                    mainContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    mainContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    mainContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
                    
                    titleLabel.topAnchor.constraint(equalTo: mainContainer.topAnchor),
                    titleLabel.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
                    titleLabel.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
                    
                    profilePicture.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
                    profilePicture.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 20),
                    profilePicture.widthAnchor.constraint(equalToConstant: 130),
                    profilePicture.heightAnchor.constraint(equalToConstant: 130),
                    
                    profileNameLabel.centerYAnchor.constraint(equalTo: profilePicture.centerYAnchor),
                    profileNameLabel.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 30),
                    
                    favoriteLabel.centerYAnchor.constraint(equalTo: mainContainer.centerYAnchor, constant: -50),
                    favoriteLabel.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
                    
                    collectionView.topAnchor.constraint(equalTo: favoriteLabel.bottomAnchor, constant: 0),
                    collectionView.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
                    collectionView.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
                    collectionView.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor),
                ])
        }
        else {
            NSLayoutConstraint.activate([
                mainContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                mainContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                mainContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                mainContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
                
                titleLabel.topAnchor.constraint(equalTo: mainContainer.topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
                
                profilePicture.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
                profilePicture.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 20),
                profilePicture.widthAnchor.constraint(equalToConstant: 130),
                profilePicture.heightAnchor.constraint(equalToConstant: 130),
                
                profileNameLabel.centerYAnchor.constraint(equalTo: profilePicture.centerYAnchor),
                profileNameLabel.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 30),
                
                favoriteLabel.centerYAnchor.constraint(equalTo: mainContainer.centerYAnchor),
                favoriteLabel.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
                
                collectionView.topAnchor.constraint(equalTo: favoriteLabel.bottomAnchor, constant: 30),
                collectionView.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor),
            ])
        }
    }
    
    func loadService() {
        serviceManager.getListMovies { responseList, responseCode, responseError in
            if let response = responseList {
                self.movieList = response.results ?? []
                DispatchQueue.main.async{
                    self.collectionView.reloadData()
                    self.collectionView.layoutIfNeeded()
                }
            }
        }
    }
}

extension movies_ProfilePresent: UICollectionViewDelegate, UICollectionViewDataSource {
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
                let formattedString = String(format: "%.1f", averange)
                cell.averangeLabel.text = "\(formattedString)"
            }
            //resenia
            cell.resumeLabel.text = list.over
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let newId = movieList?[indexPath.row].id {
            serviceManager.currentId = newId
            serviceManager.deleteFavorite { responseList, responseCode, responseError in
                if let response = responseList {
                    DispatchQueue.main.async {
                        self.dismiss(animated: true)
                    }
                }
            }
        }
    }
}
