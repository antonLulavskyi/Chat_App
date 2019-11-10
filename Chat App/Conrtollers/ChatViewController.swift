//
//  ChatViewController.swift
//  Chat App
//
//  Created by Test on 31/10/2019.
//  Copyright © 2019 Peanch. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    
    @IBOutlet weak var singOutButton: UIButton!
    @IBOutlet weak var massegeTableView: UITableView!
    @IBOutlet weak var massegeTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        massegeTableView.delegate = self
        massegeTableView.dataSource = self
        massegeTextField.delegate = self
        //massegeTableView.rowHeight = UITableView.automaticDimension
        //massegeTableView.estimatedRowHeight = 120
        
        navigationItem.hidesBackButton = true
        title = Auth.auth().currentUser?.email

        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        massegeTableView.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func signOutButtonPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print("Connection problems")
            // TODO: - create an alert for users
            
            
        }
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        massegeTextField.endEditing(true)
        
      // Disable button and text field while sending massege
        massegeTextField.isEnabled = false
        sendButton.isEnabled = false
        if let messege = massegeTextField.text {
            // Create a new child of database
            let massegesDB = Database.database().reference().child("Messages")
            // Save user messages as a dictionaty
            let messageDictionary = ["Sender": Auth.auth().currentUser?.email, "MessageBody": messege]
            // Creating custom random key for each message
            massegesDB.childByAutoId().setValue(messageDictionary) {
                (error, reference) in
                if error != nil {
                    print(error!)
                } else {
                    print("Message saved successfully!")
                    // Reset button and textField after successfull sendind a message.
                    self.massegeTextField.isEnabled = true
                    self.sendButton.isEnabled = true
                    self.massegeTextField.text = ""
                    
                    // self.massegeTableView.reloadData()
                }
            }
        }
        
    }
    
    @ objc func tableViewTapped() {
        massegeTextField.endEditing(true)
    }
    

}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMassegeCell", for: indexPath) as! CustomTableViewCell
        
        let textArray = ["Some one text", "Today is a beautiful day", "Also true, but not for everyone"]
        cell.massegeLabel.text = textArray[indexPath.row]
        
         return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
// MARK: - Extension UITextFieldDelegate
extension ChatViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 360
            self.view.layoutIfNeeded()
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
          UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 128
            self.view.layoutIfNeeded()
              }
    }
}
