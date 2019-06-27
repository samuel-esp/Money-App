//
//  Item.swift
//  Money App
//
//  Created by Samuel-Mac on 27/06/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    var name: String
    var date: Date
    var valueDollars: Int
    var isGain: Bool
    
    init(name: String, date: Date, valueDollars: Int, isGain: Bool) {
        
        self.name = name
        self.date = date
        self.valueDollars = valueDollars
        self.isGain = isGain
        
        super.init()
    }
    
    
}
