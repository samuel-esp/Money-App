//
//  AddItemViewController.swift
//  Money App
//
//  Created by Samuel-Mac on 28/06/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import UIKit

protocol SendDataDelegate {
    
    func didSendDataBack(itemCollections: ItemsCollection)
    
}

class AddItemViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var valueField: UITextField!
    var sendDataDelegate: SendDataDelegate?
    var pickerData: [String] = ["Gained", "Lost"]
    var itemsCollection: ItemsCollection!
    var isGain: Bool!
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        var item: Item!
        
        if let name = nameField.text, let value = valueField.text{
            item = Item(name: name, date: datePicker.date, valueDollars: Double(value)!, isGain: isGain)
        }else{
            item = Item(name: "NoName", date: datePicker.date, valueDollars: 0.0, isGain: true)
        }
        
        itemsCollection.itemArray.append(item)
        sendDataDelegate?.didSendDataBack(itemCollections: itemsCollection)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isGain = true
        pickerView.delegate = self
        pickerView.dataSource = self
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

}
