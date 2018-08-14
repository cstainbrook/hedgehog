//
//  ViewController.swift
//  Hedgehog
//
//  Created by Cooper Stainbrook on 8/9/18.
//  Copyright © 2018 Cooper Stainbrook. All rights reserved.
//

import UIKit

class LockedinStationViewController: UIViewController, ConfirmUseViewControllerDelegate {
    
    @IBOutlet weak var redeemButton: UIButton!
    
    override func viewDidLoad() {
        redeemButton.layer.cornerRadius = 5
    }
    
    
    //MARK:- Navigation and Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "confirmUseSegue" {
            let controller = segue.destination as! ConfirmUseViewController
            controller.delegate = self
        }
    }

    //MARK:- ConfirmUseViewController Delegates
    func confirmUseShouldCancel(_ confirmUseViewController: ConfirmUseViewController) {
        navigationController?.popViewController(animated: true)
    }
    
}

