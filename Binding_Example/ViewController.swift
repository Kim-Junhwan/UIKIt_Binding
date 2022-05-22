//
//  ViewController.swift
//  Binding_Example
//
//  Created by JunHwan Kim on 2022/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var loginVM = LoginViewModel()
    
    lazy var usernameTextField : UITextField = {
    let userNameTextField = BindingTextField()
    userNameTextField.placeholder = "Enter username"
    userNameTextField.backgroundColor = UIColor.lightGray
    userNameTextField.borderStyle = .roundedRect
    userNameTextField.bind { [weak self] text in
        print(text)
        self?.loginVM.username.value = text
    }
        return userNameTextField
    }()
    
    lazy var passwordTextField : UITextField = {
        let passwordTextField = BindingTextField()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Enter password"
        passwordTextField.backgroundColor = UIColor.lightGray
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.bind { [weak self] text in
            print(text)
            self?.loginVM.password.value = text
        }
        return passwordTextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginVM.username.bind { [weak self] text in
            self?.usernameTextField.text = text
        }
        
        loginVM.password.bind { [weak self] text in
            self?.passwordTextField.text = text
        }
        setupUI()
    }
    
    @objc func login(){
        print(loginVM.username.value)
        print(loginVM.password.value)
    }
    
    @objc func fetchLoginInfo(){
        print("Press fetch info")
        DispatchQueue.main.asyncAfter(deadline: .now()+2.0) { [weak self] in
            self?.loginVM.username.value = "mary"
            self?.loginVM.password.value = "12345"
        }
        
    }
    
    func setupUI(){
        let loginButton = UIButton()
        loginButton.setTitle("login", for: .normal)
        loginButton.backgroundColor = UIColor.gray
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        
        //MARK: - View Model to View
        let fetchLoginInfoButton = UIButton()
        fetchLoginInfoButton.setTitle("Fetch login Info", for: .normal)
        fetchLoginInfoButton.backgroundColor = UIColor.blue
        fetchLoginInfoButton.addTarget(self, action: #selector(fetchLoginInfo), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField, loginButton, fetchLoginInfoButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
    }
    
     

}

