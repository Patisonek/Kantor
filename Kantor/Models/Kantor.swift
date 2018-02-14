//
//  Kantor.swift
//  Kantor
//
//  Created by Admin on 14/02/2018.
//  Copyright © 2018 patisonek. All rights reserved.
//

import UIKit

class Kantor: NSObject {
    
    func exchange(amount: Float, currencyCode: String) -> (buy: Float, sell: Float) {
        
        let buy = amount * 3
        let sell = amount * 4
        
        return (buy,sell)
    }

}
