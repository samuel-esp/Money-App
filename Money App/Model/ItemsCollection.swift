//
//  ItemsCollection.swift
//  Money App
//
//  Created by Samuel-Mac on 27/06/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import UIKit

class ItemsCollection: NSObject {
    
    var itemArray = [Item]()

    @discardableResult func createItem(name: String, date: Date, valueDollars: Double, isGain: Bool) -> Item{
        
        let item = Item(name: name, date: date, valueDollars: valueDollars, isGain: isGain)
        
        itemArray.append(item)
        
        return item
    }
    
    func deleteItem(item: Item){
        
        if let itemIndex = itemArray.index(of: item){

            itemArray.remove(at: itemIndex)
            
        }
        
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int){
        
        if fromIndex == toIndex{
            return
        }
        
        let movedItem = itemArray.remove(at: fromIndex)
        itemArray.insert(movedItem, at: toIndex)
    
    }
    
    
    override init() {
        super.init()
    }
    
}
