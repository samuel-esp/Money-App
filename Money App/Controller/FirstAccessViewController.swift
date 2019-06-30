//
//  FirstAccessViewController.swift
//  Money App
//
//  Created by Samuel-Mac on 28/06/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import UIKit

class FirstAccessViewController: UIViewController {
    
    var itemsCollection: ItemsCollection!
    var user: Username!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var savingsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        let result = save()
        print(result)
        performSegue(withIdentifier: "firstVC", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "firstVC":
            if let name = nameTextField.text, let savings = savingsTextField.text{
                
                let savingsDouble = Double(savings)
                user.user = name
                user.savings = savingsDouble!
                let barViewControllers = segue.destination as! UITabBarController
                let navControllerOne = barViewControllers.viewControllers![0] as! UINavigationController
                let navControllerTwo = barViewControllers.viewControllers![1] as! UINavigationController
                let secondVC = navControllerTwo.viewControllers[0] as! SecondViewController
                let firstVC = navControllerOne.viewControllers[0] as! ViewController
                firstVC.user = user
                firstVC.itemsCollection = itemsCollection
                secondVC.user = user
                secondVC.items = itemsCollection
                
            }else{
  
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
    
    func save() -> Bool{
        return NSKeyedArchiver.archiveRootObject(user, toFile: user.userArchive.path)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let result = save()
        if(result){
            print(result)
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


