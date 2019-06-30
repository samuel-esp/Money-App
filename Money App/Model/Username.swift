//
//  Username.swift
//  Money App
//
//  Created by Samuel-Mac on 28/06/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import UIKit

class Username: NSObject, NSCoding{
    
    var user: String
    var savings: Double
    let userArchive: URL = {
       
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("user.darssff")
        
    }()
    
    init(user: String, savings: Double) {
        self.user = user
        self.savings = savings
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(user, forKey: "user")
        aCoder.encode(savings, forKey: "savings")
    }
    
    required init?(coder aDecoder: NSCoder) {
        user = aDecoder.decodeObject(forKey: "user") as! String
        savings = aDecoder.decodeDouble(forKey: "savings") as Double
        super.init()
    }
    

}
