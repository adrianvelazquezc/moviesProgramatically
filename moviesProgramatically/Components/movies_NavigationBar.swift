//
//  movies_NavigationBar.swift
//  moviesProgramatically
//
//  Created by Mac on 19/02/23.
//

import UIKit

public protocol movies_NavigationBarDelegate {
    func buttonTapped()
}

open class movies_NavigationBar: UIView {
    
    var delegate: movies_NavigationBarDelegate?
    
    lazy private var navigationTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var menuButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 14, height: 7))
        button.tintColor = .lightGray
        button.setImage(UIImage(named: "menuIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.buttonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setUI()
        setConstraints()
    }
    
    public func buildComponents(titleText: String, textColor: UIColor = .white, delegate: movies_NavigationBarDelegate) {
        self.delegate = delegate
        navigationTitle.text = titleText
        navigationTitle.textColor = textColor
        menuButton.tintColor = .lightGray
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        self.backgroundColor =  #colorLiteral(red: 0.215639472, green: 0.2463306785, blue: 0.2608401179, alpha: 1)
        self.addSubview(navigationTitle)
        self.addSubview(menuButton)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 80),
            
            navigationTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            navigationTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            menuButton.centerYAnchor.constraint(equalTo: navigationTitle.centerYAnchor),
            menuButton.widthAnchor.constraint(equalToConstant: 15),
            menuButton.heightAnchor.constraint(equalToConstant: 15),
            menuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    @objc private func buttonTapped(_ sender: UIButton){
        delegate?.buttonTapped()
    }
}
