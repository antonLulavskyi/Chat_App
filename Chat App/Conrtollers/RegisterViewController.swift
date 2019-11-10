//
//  RegisterViewController.swift
//  Chat App
//
//  Created by Test on 31/10/2019.
//  Copyright © 2019 Peanch. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    print(error!)
                } else {
                    self.performSegue(withIdentifier: "fromRegister", sender: self)
                    print("Registration successful")
                }
            }
        }
    }
    
  

}
