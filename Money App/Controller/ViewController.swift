//
//  ViewController.swift
//  Money App
//
//  Created by Samuel-Mac on 27/06/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SendDataDelegate {
    
    func didSendDataBack(itemCollections: ItemsCollection) {
        itemsCollection.itemArray = itemCollections.itemArray
    }
    

    var itemsCollection: ItemsCollection!
    var user: Username!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
                performSegue(withIdentifier: "add", sender: self)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsCollection.itemArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "moneyCell", for: indexPath) as! MoneyHistoryTableViewCell
        let element = itemsCollection.itemArray[indexPath.row]
        
        cell.name.text = element.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let data = dateFormatter.string(from: element.date)
        
        cell.date.text = data
        
        if(element.isGain){
            cell.value.textColor = .green
            cell.value.text = "+\(element.valueDollars)$"
        }else{
            cell.value.textColor = .red
            cell.value.text = "-\(element.valueDollars)$"
        }
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "add":
            
            let addVC = segue.destination as! AddItemViewController
            addVC.itemsCollection = itemsCollection
            addVC.sendDataDelegate = self
            
        default:
            preconditionFailure()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
}



