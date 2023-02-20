//
//  movies_GeneralMoviesListViewCell.swift
//  moviesProgramatically
//
//  Created by Mac on 19/02/23.
//


import UIKit

class movies_GeneralMoviesListViewCell: UICollectionViewCell {
    
    static let identifier = "movies_GeneralMoviesListViewCell"
    
    private var mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor =  #colorLiteral(red: 0.106094636, green: 0.1726573706, blue: 0.2030406594, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public var posterPicture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    public var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor =  #colorLiteral(red: 0.4548825622, green: 0.8329617977, blue: 0.4634124041, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public convenience init(){
        self.init()
    }
    
    fileprivate func setupUIElements() {
        self.backgroundColor = .clear
        self.addSubview(mainContainer)
        mainContainer.addSubview(posterPicture)
        mainContainer.addSubview(titleLabel)
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.mainContainer.topAnchor.constraint(equalTo: self.topAnchor),
            self.mainContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.mainContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.mainContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.mainContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.posterPicture.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            self.posterPicture.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            self.posterPicture.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            self.posterPicture.widthAnchor.constraint(equalToConstant: 100),
            self.posterPicture.heightAnchor.constraint(equalToConstant: 200),
            
            self.titleLabel.topAnchor.constraint(equalTo: posterPicture.bottomAnchor, constant: 10),
            self.titleLabel.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            self.titleLabel.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor, constant: -5),
            self.titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16)
        ])
    }
}
