//
//  Kantor.swift
//  Kantor
//
//  Created by Admin on 14/02/2018.
//  Copyright © 2018 patisonek. All rights reserved.
//

import UIKit

class Kantor: NSObject {
    
    override init() {
        
        if let path = Bundle.main.path(forResource: "currencies", ofType: "plist") {
        
        
            
            print("path\(path)")
            
            if let list = NSArray(contentsOfFile: path) as Array <AnyObject>? {
                
                for item in list {
                    print("item: \(item)")
                }
            }
            else {
                print("Currences file is not found")
                abort()
            }
        }
    }
    
    func exchange(amount: Float, currencyCode: String) -> (buy: Float, sell: Float) {
        
        let buy = amount * 3
        let sell = amount * 4
        
        return (buy,sell)
    }

}
