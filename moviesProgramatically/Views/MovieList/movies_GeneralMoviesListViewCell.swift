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
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public var posterPicture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        return image
    }()
    
    public var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor =  #colorLiteral(red: 0.4548825622, green: 0.8329617977, blue: 0.4634124041, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    public var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor =  #colorLiteral(red: 0.4548825622, green: 0.8329617977, blue: 0.4634124041, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var averangeLabel: UILabel = {
        let label = UILabel()
        label.textColor =  #colorLiteral(red: 0.4548825622, green: 0.8329617977, blue: 0.4634124041, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    public var resumeLabel: UILabel = {
        let label = UILabel()
        label.textColor =  .white
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        return label
    }()
    
    private var starPicture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = #colorLiteral(red: 0.4548825622, green: 0.8329617977, blue: 0.4634124041, alpha: 1)
        image.image = UIImage(systemName: "star.fill")
        return image
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
        mainContainer.addSubview(dateLabel)
        mainContainer.addSubview(averangeLabel)
        mainContainer.addSubview(resumeLabel)
        mainContainer.addSubview(starPicture)
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
            self.titleLabel.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 10),
            self.titleLabel.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -10),
            self.dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            self.dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            self.averangeLabel.topAnchor.constraint(equalTo: dateLabel.topAnchor),
            self.averangeLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 10),
            self.averangeLabel.widthAnchor.constraint(equalToConstant: 25),
            self.averangeLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            self.starPicture.centerYAnchor.constraint(equalTo: averangeLabel.centerYAnchor),
            self.starPicture.heightAnchor.constraint(equalToConstant: 10),
            self.starPicture.widthAnchor.constraint(equalToConstant: 10),
            self.starPicture.trailingAnchor.constraint(equalTo: averangeLabel.leadingAnchor, constant: 2),
            
            self.resumeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15),
            self.resumeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            self.resumeLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            self.resumeLabel.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor, constant: -20),
        ])
    }
}
