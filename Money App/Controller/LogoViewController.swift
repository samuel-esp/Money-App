//
//  LogoViewController.swift
//  Money App
//
//  Created by Samuel-Mac on 28/06/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import UIKit

class LogoViewController: UIViewController {
    
    var isFirstAccess: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        let timer = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(moveOn), userInfo: nil, repeats: false)

    }
    
    @objc func moveOn(){
        self.performSegue(withIdentifier:"firstAccess",sender: self)
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
