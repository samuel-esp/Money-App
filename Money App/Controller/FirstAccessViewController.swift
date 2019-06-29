//
//  FirstAccessViewController.swift
//  Money App
//
//  Created by Samuel-Mac on 28/06/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import UIKit

class FirstAccessViewController: UIViewController {
    
    var itemsCollection = ItemsCollection()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var savingsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "firstVC", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "firstVC":
            if let name = nameTextField.text, let savings = savingsTextField.text{
                
                let savingsDouble = Double(savings)
                let user = Username(user: name, savings: savingsDouble!)
                let barViewControllers = segue.destination as! UITabBarController
                let secondVC = barViewControllers.viewControllers![1] as! SecondViewController
                let firstVC = barViewControllers.viewControllers![0] as! ViewController
                firstVC.user = user
                firstVC.itemsCollection = self.itemsCollection
                secondVC.user = user
                secondVC.items = self.itemsCollection
                
            }else{
                
                let user = Username(user: "", savings: 0.0)
                let barViewControllers = segue.destination as! UITabBarController
                let secondVC = barViewControllers.viewControllers![1] as! SecondViewController
                let firstVC = barViewControllers.viewControllers![0] as! ViewController
                
                firstVC.user = user
                firstVC.itemsCollection = itemsCollection
                secondVC.user = user
                secondVC.items = itemsCollection
                
            }
        default:
            preconditionFailure("error")
        }
            
    
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


