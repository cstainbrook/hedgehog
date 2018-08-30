//
//  CreateAccountViewController.swift
//  Hedgehog
//
//  Created by Cooper Stainbrook on 8/28/18.
//  Copyright © 2018 Cooper Stainbrook. All rights reserved.
//

import UIKit
import Firebase


class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func registerAccount(_ sender: UIButton) {
    
        //Make sure all of the fields have a value
        guard let name = nameTextField.text, name != "", let emailAddress = emailTextField.text, emailAddress != "", let password = passwordTextField.text, password != "" else {
            
            //Create alert to notify the user that one of the fields is empty.
            let alertController = UIAlertController(title: "Registration Error", message: "Please make sure you provide your name, email address and password to complete the registration", preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(dismissAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        //If fields are vaild, register the user on Firebase.
        Auth.auth().createUser(withEmail: emailAddress, password: password, completion: { (user, error) in
            if let error = error {
                //Inform user of the error.
                let alertController = UIAlertController(title: "Registration Error", message: error.localizedDescription, preferredStyle: .alert)
                let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(dismissAction)
                self.present(alertController, animated: true, completion: nil)
                return
            }
            
            //Save the name of the user
            if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                changeRequest.displayName = name
                changeRequest.commitChanges(completion: { (error) in
                    if let error = error {
                        print ("Failed to change the display name \(error.localizedDescription)")
                    }
                })
            }
            
            //Dismiss keyboard
            self.view.endEditing(true)
            
            //Send verification email and notify user that they need to check their email.
            Auth.auth().currentUser?.sendEmailVerification(completion: nil)
            
            let alertController = UIAlertController(title: "Email Verification", message: "Please check your email and click on the verification link.", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                self.dismiss(animated: true, completion: nil)
            })
            alertController.addAction(okayAction)
            self.present(alertController, animated: true, completion: nil)
        })
    }
    
    
}
