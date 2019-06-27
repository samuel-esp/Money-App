//
//  MoneyHistoryTableViewController.swift
//  Money App
//
//  Created by Samuel-Mac on 27/06/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import UIKit

class MoneyHistoryTableViewController: UITableViewController {
    
    var itemsCollection = ItemsCollection()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsCollection.itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "moneyCell", for: indexPath) as! MoneyHistoryTableViewCell
        let element = itemsCollection.itemArray[indexPath.row]
        
        cell.name.text = element.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let data = dateFormatter.string(from: element.date)
        
        cell.date.text = data
        cell.value.text = "\(element.valueDollars)$"
        
        if(element.isGain){
            cell.value.textColor = .red
        }else{
            cell.value.textColor = .green
        }
    
        return cell
        
    }
}
