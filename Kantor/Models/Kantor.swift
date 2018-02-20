//
//  Kantor.swift
//  Kantor
//
//  Created by Admin on 14/02/2018.
//  Copyright © 2018 patisonek. All rights reserved.
//

import UIKit

struct Currency {
    
    var code: String
    var name: String
    var buy: Float
    var sell: Float
    var conversion: Float
    
}


class Kantor: NSObject {
    
    var currencies: [String: Currency] = [:]
    
    override init() {
        
        if let path = Bundle.main.path(forResource: "currencies", ofType: "plist") {
        
        
            
            print("path\(path)")
            
            if let list = NSArray(contentsOfFile: path) as Array <AnyObject>? {
                
                for item in list {
                    print("item: \(item)")
                    
                    var name = item["name"] as! String
                    var code = item["code"] as! String
                    var buy = item["buy"] as! Float
                    var sell = item["sell"] as! Float
                    var conversion = item["conversion"] as! Float
                    
                    let curr = Currency(code: code, name: name, buy: buy, sell: sell, conversion: conversion )
                    
                    currencies.updateValue(curr, forKey: code)
                    
                }
            }
            else {
                print("Currences file is not found")
                abort()
            }
        }
    }
    
    func exchange(amount: Float, currencyCode: String) -> (buy: Float, sell: Float) {
        
        if let selected = currencies[currencyCode] {
            
            let buy = amount * selected.buy
            let sell = amount * selected.sell
            
            
            return (buy,sell)
            
        }
        print("Currency data is missing for code \(currencyCode)")
        return (0.0,0.0)
        
    }

}
