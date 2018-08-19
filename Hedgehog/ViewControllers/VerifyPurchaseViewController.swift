//
//  VerifyPurchaseViewController.swift
//  Hedgehog
//
//  Created by Cooper Stainbrook on 8/13/18.
//  Copyright © 2018 Cooper Stainbrook. All rights reserved.
//

import UIKit

class VerifyPurchaseViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var totalPriceTextField: UITextField!
    @IBOutlet weak var totalGallonsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.totalPriceTextField.delegate = self
        self.totalGallonsTextField.delegate = self
        
        //Add done button to decimal pad
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 30))
        doneToolbar.barStyle = UIBarStyle.default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))

        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)

        doneToolbar.items = items
        doneToolbar.sizeToFit()

        self.totalPriceTextField.inputAccessoryView = doneToolbar
        self.totalGallonsTextField.inputAccessoryView = doneToolbar

    }
    
    
    //MARK:- Keyboard Actions
    //Dismiss the keyboard on done button press.
    @objc func doneButtonAction() {
        view.endEditing(true)
        self.totalPriceTextField.endEditing(true)
    }

    //    Dismiss the keyboard on a tap outside of the keyboard.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
