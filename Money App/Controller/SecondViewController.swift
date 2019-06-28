//
//  SecondViewController.swift
//  Money App
//
//  Created by Samuel-Mac on 28/06/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var items = ViewController().itemsCollection
    var user: Username!
    var max: Double = 0.0
    var min: Double = 0.0
    var transactions: Int = 0
    var gains: Int = 0
    var loss: Int = 0
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var balanceMin: UILabel!
    @IBOutlet weak var balanceValue: UILabel!
    @IBOutlet weak var balanceMinimum: UILabel!
    @IBOutlet weak var gainValue: UILabel!
    @IBOutlet weak var lossValue: UILabel!
    @IBOutlet weak var totalTransactionsValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        max = maximumPeak()
        totalTransactionsValue.text = "\(transactionsNumber()) $"
        gainValue.text = "\(gainTransactions()) $"
        lossValue.text = "\(lossTransactions()) $"
        balanceValue.text = "\(maximumPeak()) $"
        balanceMinimum.text = "\(minimumPeak()) $"
        usernameLabel.text = "Hey \(user.user)!!"
        labelValue.text = "\(user.savings)$"
        // Do any additional setup after loading the view.
    }
    
    func maximumPeak() -> Double {
        
        var record: Double = 0.0
        
        if(items.itemArray.count == 0){
            return 0
        }
        
        for elem in items.itemArray{
            
            record = Double(elem.valueDollars) + record
            
        }
        
        if(record>max){
            return record
        }
        
        return max
        
    }
    
    func minimumPeak() -> Double {
        
        var record: Double = 0.0
        
        if(items.itemArray.count == 0){
            return 0
        }
        
        for elem in items.itemArray{
            
            record = Double(elem.valueDollars) + record
            
        }
        
        if(record<min){
            return record
        }
        
        return min
        
    }
    
    func transactionsNumber() -> Int {
        
        return items.itemArray.count
        
    }
    
    func gainTransactions() -> Int {
        
        var i = 0
        
        for elem in items.itemArray{
            
            if(elem.isGain){
                i = i + 1
            }
            
        }
        
        return i
        
    }
    
    func lossTransactions() -> Int {
        
        var i = 0
        
        for elem in items.itemArray{
            
            if(!elem.isGain){
                
                i = i + 1
                
            }
        
        }
        
        return i
        
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
