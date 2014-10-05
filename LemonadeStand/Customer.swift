//
//  Customer.swift
//  LemonadeStand
//
//  Created by Paul Uhn on 10/5/14.
//  Copyright (c) 2014 Paul. All rights reserved.
//

import Foundation

class Customer {
    var taste = 0.0
    
    func setupTaste() {
        taste = Double(arc4random_uniform(11)) / 10.0
    }    
}