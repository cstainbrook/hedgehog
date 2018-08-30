//
//  EmailLoginController.swift
//  Hedgehog
//
//  Created by Cooper Stainbrook on 8/28/18.
//  Copyright © 2018 Cooper Stainbrook. All rights reserved.
//

import UIKit
import Firebase

class EmailLoginController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func emailLogin(_ sender: UIButton) {
        
        //Make sure all of the fields have a value
        guard let emailAddress = emailTextField.text, emailAddress != "", let password = passwordTextField.text, password != "" else {
            
            //Create alert to notify the user that one of the fields is empty.
            let alertController = UIAlertController(title: "Registration Error", message: "Please enter an email address and password", preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(dismissAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        //If fields are vaild, perform login by calling Firebase API.
        Auth.auth().signIn(withEmail: emailAddress, password: password, completion: { (user, error) in
            if let error = error {
                //Inform user of the error.
                let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(dismissAction)
                self.present(alertController, animated: true, completion: nil)
                return
            }
            
            //Ensure email has been validated.
            guard let currentUser = Auth.auth().currentUser, currentUser.isEmailVerified else {
                let alertController = UIAlertController(title: "Login Error", message: "Please confirm your email address by clicking the link in the email that we have sent you.  If you need another confirmation email, please tap Resend Email", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "Resend Email", style: .default, handler: { (action) in
                    Auth.auth().currentUser?.sendEmailVerification(completion: nil)
                })
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                alertController.addAction(cancelAction)
                self.present(alertController, animated: true, completion: nil)
                return
            }
            
            //Dismiss keyboard
            self.view.endEditing(true)
            
            //Present the main view
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeView") {
                UIApplication.shared.keyWindow?.rootViewController = viewController
                self.dismiss(animated: true, completion: nil)
            }
            
        })
        
    }
    
    
}
