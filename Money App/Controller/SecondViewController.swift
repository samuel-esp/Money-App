//
//  SecondViewController.swift
//  Money App
//
//  Created by Samuel-Mac on 28/06/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //var items = ViewController().itemsCollection
    var items: ItemsCollection!
    var user: Username!
    var max: Double!
    var min: Double!
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
        min = user.savings
        max = user.savings
        labelValue.text = "\(available())$"
        usernameLabel.text = "Hey \(user.user)!!"
        totalTransactionsValue.text = "\(transactionsNumber())"
        gainValue.text = "\(gainTransactions())"
        lossValue.text = "\(lossTransactions())"
        balanceValue.text = "\(maximumPeak()) $"
        balanceMinimum.text = "\(minimumPeak()) $"
        // Do any additional setup after loading the view.
    }
    
    func available() -> Double{
        
        var record = user.savings
        
        if(items.itemArray.count==0){
            return record
    }
        
        for elem in items.itemArray{
            
            if(elem.isGain){
                record = record + elem.valueDollars
            }else{
                if(record<0){
                    record = 0.0
                    return record
                }
                else{
                    record = record - elem.valueDollars
                }
            }
            
        }
        
        return record
        
    }
    
    func maximumPeak() -> Double {
        
        if(available()>max){
            return available()
        }
        else{
            return user.savings
        }
        
    }
    
    func minimumPeak() -> Double {
        
        if(available()<min){
            return available()
        }
        else{
            return user.savings
        }
        
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
