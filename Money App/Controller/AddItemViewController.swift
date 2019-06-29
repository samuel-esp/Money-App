//
//  AddItemViewController.swift
//  Money App
//
//  Created by Samuel-Mac on 28/06/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var valueField: UITextField!
    var pickerData: [String] = ["Gained", "Lost"]
    var itemsCollection: ItemsCollection!
    var yourUser: Username!
    var isGain: Bool!
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "newItem", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        isGain = false
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
       let selectedValue = pickerData[row] as String
        if(selectedValue=="Gained"){
            isGain=true
        }else{
            isGain=false
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "newItem":
            
            if let name = nameField.text, let value = valueField.text{
                let barViewControllers = segue.destination as! UITabBarController
                let secondVC = barViewControllers.viewControllers![1] as! SecondViewController
                let firstVC = barViewControllers.viewControllers![0] as! ViewController
                self.itemsCollection.itemArray.append(Item(name: name, date: datePicker.date, valueDollars: Double(value)!, isGain: isGain))
                firstVC.itemsCollection = itemsCollection
                secondVC.items = itemsCollection
                firstVC.user = yourUser
                secondVC.user = yourUser
                
            }else{
                preconditionFailure("error")
            }
        default:
            preconditionFailure("error")
        }
        
        
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
