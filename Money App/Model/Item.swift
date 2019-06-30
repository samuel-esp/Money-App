//
//  Item.swift
//  Money App
//
//  Created by Samuel-Mac on 27/06/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    
    var name: String
    var date: Date
    var valueDollars: Double
    var isGain: Bool
    
    init(name: String, date: Date, valueDollars: Double, isGain: Bool) {
        
        self.name = name
        self.date = date
        self.valueDollars = valueDollars
        self.isGain = isGain
        
        super.init()
    }
    
   func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(valueDollars, forKey: "valueDollars")
        aCoder.encode(isGain, forKey: "isGain")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        date = aDecoder.decodeObject(forKey: "date") as! Date
        valueDollars = aDecoder.decodeObject(forKey: "valueDollars") as? Double ?? 0
        isGain = aDecoder.decodeObject(forKey: "isGain") as? Bool ?? true
        
        super.init()
    }
    
    
}
