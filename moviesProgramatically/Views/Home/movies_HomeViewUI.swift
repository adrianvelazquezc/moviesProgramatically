//
//  movies_HomeViewUI.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import Foundation
import UIKit

protocol movies_HomeViewUIDelegate {
    func notifyUserAndPassword(name: String, password: String)
}

class movies_HomeViewUI: UIView{
    var delegate: movies_HomeViewUIDelegate?
    var navigationController: UINavigationController?
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.attributedText = getDecorativeTitleText(text: "Bienvenido")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Usuario"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userNameTextField : UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.layer.borderWidth = 0.5
        textfield.layer.cornerRadius = 10
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.size.height))
            textfield.leftView = leftView
            textfield.leftViewMode = .always
        return textfield
    }()
    
    let userPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Contraseña"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userPasswordTextField : UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.layer.borderWidth = 0.5
        textfield.layer.cornerRadius = 10
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.size.height))
            textfield.leftView = leftView
            textfield.leftViewMode = .always
        return textfield
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continuar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 25
        button.backgroundColor = .link
        return button
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: movies_HomeViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            let gestoTap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard(_:)))
            self.addGestureRecognizer(gestoTap)
            
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
        self.addSubview(welcomeLabel)
        self.addSubview(userNameLabel)
        self.addSubview(userNameTextField)
        self.addSubview(userPasswordLabel)
        self.addSubview(userPasswordTextField)
        self.addSubview(continueButton)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            userNameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 50),
            userNameLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            userNameLabel.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            
            userNameTextField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 20),
            userNameTextField.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            userNameTextField.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            userNameTextField.heightAnchor.constraint(equalToConstant: 35),
            
            userPasswordLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 50),
            userPasswordLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            userPasswordLabel.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            
            userPasswordTextField.topAnchor.constraint(equalTo: userPasswordLabel.bottomAnchor, constant: 20),
            userPasswordTextField.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            userPasswordTextField.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            userPasswordTextField.heightAnchor.constraint(equalToConstant: 35),
            
            continueButton.topAnchor.constraint(equalTo: userPasswordTextField.bottomAnchor, constant: 50),
            continueButton.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func dissmisKeyboard(_ sender: UITapGestureRecognizer){
        self.endEditing(true)
    }
    @objc func buttonTapped(_ sender: UITapGestureRecognizer) {
        self.delegate?.notifyUserAndPassword(name: userNameTextField.text ?? "", password: userPasswordTextField.text ?? "")
    }
}
