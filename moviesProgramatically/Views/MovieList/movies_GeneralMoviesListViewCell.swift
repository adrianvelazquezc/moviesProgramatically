//
//  movies_GeneralMoviesListViewCell.swift
//  moviesProgramatically
//
//  Created by Mac on 19/02/23.
//


import UIKit

class movies_GeneralMoviesListViewCell: UICollectionViewCell {
    
    static let identifier = "movies_GeneralMoviesListViewCell"
    
    public var posterPicture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    public var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
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
        self.addSubview(posterPicture)
        self.addSubview(titleLabel)
        self.backgroundColor = .clear
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            self.posterPicture.topAnchor.constraint(equalTo: self.topAnchor),
            self.posterPicture.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.posterPicture.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.posterPicture.widthAnchor.constraint(equalToConstant: 100),
            self.posterPicture.heightAnchor.constraint(equalToConstant: 200),
            
            self.titleLabel.topAnchor.constraint(equalTo: posterPicture.bottomAnchor, constant: 10),
            self.titleLabel.leadingAnchor.constraint(equalTo: posterPicture.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: posterPicture.trailingAnchor),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            self.titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16)
        ])
    }
}
