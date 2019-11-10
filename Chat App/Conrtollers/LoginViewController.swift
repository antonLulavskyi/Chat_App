//
//  LoginViewController.swift
//  Chat App
//
//  Created by Test on 31/10/2019.
//  Copyright © 2019 Peanch. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let er = error {
                    print(er)
                    //TODO: - create an alert for user
                } else {
                    self.performSegue(withIdentifier: "fromLoginToChat", sender: self)
                }
            }
        }
    }
 

}
