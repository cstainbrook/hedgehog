//
//  ConfirmUseViewController.swift
//  Hedgehog
//
//  Created by Cooper Stainbrook on 8/13/18.
//  Copyright © 2018 Cooper Stainbrook. All rights reserved.
//

import UIKit

protocol ConfirmUseViewControllerDelegate: class {
    func confirmUseShouldCancel(_ confirmUseViewController: ConfirmUseViewController)
}

class ConfirmUseViewController: UIViewController {
    
    weak var delegate: ConfirmUseViewControllerDelegate?
    
    @IBOutlet weak var confirmMessageLabel: UILabel!
    
    override func viewDidLoad() {
        confirmMessageLabel.layer.masksToBounds = true
        confirmMessageLabel.layer.cornerRadius = 5
    }
    
    @IBAction func cancelButtonHit(_ sender: UIButton) {
        delegate?.confirmUseShouldCancel(self)
    }
    
    
}

