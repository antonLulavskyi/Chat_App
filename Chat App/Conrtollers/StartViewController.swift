//
//  ViewController.swift
//  Chat App
//
//  Created by Test on 27/10/2019.
//  Copyright © 2019 Peanch. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var chatAppLogoLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonsSetup(button: loginButton, CornerRadius: 12, borderWidth: 1, borderColor: UIColor.green)
        buttonsSetup(button: registerButton, CornerRadius: 12, borderWidth: 1, borderColor: UIColor.red)
    }
    
//MARK: - prepare segue to the login screen
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
    
//MARK: - prepare segue to the register screen
    @IBAction func registerButtonPressed(_ sender: UIButton) {
    }
    
//MARK:- login and register buttons setup
    func buttonsSetup(button: UIButton, CornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        button.layer.cornerRadius = CornerRadius
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor.cgColor
    }
    
}

