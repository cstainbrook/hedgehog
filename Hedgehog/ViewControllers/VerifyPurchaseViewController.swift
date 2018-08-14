//
//  VerifyPurchaseViewController.swift
//  Hedgehog
//
//  Created by Cooper Stainbrook on 8/13/18.
//  Copyright © 2018 Cooper Stainbrook. All rights reserved.
//

import UIKit

class VerifyPurchaseViewController: UIViewController {
    
    @IBOutlet weak var totalPriceTextField: UITextField!
    @IBOutlet weak var totalGallonsTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add done button to decimal pad
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 30))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: Selector(("doneButtonAction:")))
        
        toolbar.setItems([flexSpace, doneButton], animated: true)
        toolbar.sizeToFit()
        
        self.totalPriceTextField.inputAccessoryView = toolbar
        self.totalGallonsTextField.inputAccessoryView = toolbar
    }
    
    
    //TODO:- Causing error unrecognized selector sent to instance
    func doneButtonAction(sender: AnyObject?) {
        self.view.endEditing(true)
    }
    
    
}
