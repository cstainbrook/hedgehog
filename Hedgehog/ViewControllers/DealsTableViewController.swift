//
//  DealsTableViewController.swift
//  Hedgehog
//
//  Created by Cooper Stainbrook on 8/19/18.
//  Copyright © 2018 Cooper Stainbrook. All rights reserved.
//

import UIKit

class DealsTableViewController: UITableViewController {
    
    let dealsModel = DealsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Enable large titles
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func makeDealCell(for tableView: UITableView) -> UITableViewCell {
        let cellIdentifier = "dealCell"
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "dealCell") {
            return cell
        } else {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    //MARK:- TableView Functions
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dealsModel.productArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = makeDealCell(for: tableView)
        
        let dealProduct = dealsModel.productArray[indexPath.row]
        let dealDescription = dealsModel.dealDescriptionArray[indexPath.row]
        let dealImage = UIImage(named: dealsModel.dealImageArray[indexPath.row])
        cell.textLabel!.text = dealProduct
        cell.detailTextLabel!.text = dealDescription
        cell.imageView!.image = dealImage
        return cell
    }
    
    
}
