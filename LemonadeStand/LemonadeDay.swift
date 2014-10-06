//
//  LemonadeDay.swift
//  LemonadeStand
//
//  Created by Paul Uhn on 10/5/14.
//  Copyright (c) 2014 Paul. All rights reserved.
//

import Foundation

class LemonadeDay {
    
    var customers:[Customer] = []
    
    func sales(lemonade:Lemonade) -> Int {
        var money = 0
        setupCustomers()
        for customer in customers {
            if customerType(customer) == lemonadeType(lemonade) {
                money += 1
                println("Paid!")
            } else {
                println("No match, no revenue")
            }
        }
        return money
    }
    
    func setupCustomers() {
        let totalCustomers = Int(arc4random_uniform(10)) + 1
        for var customerNumber = 0; customerNumber < totalCustomers; customerNumber++ {
            var customer = Customer()
            customer.setupTaste()
            customers.append(customer)
        }
    }
    
    func lemonadeType(lemonade:Lemonade) -> Int {
        var ratio = lemonade.ratio()
        if ratio > 1.0 {
            return 1
        }
        else if ratio == 1.0 {
            return 2
        }
        else {
            return 3
        }
    }
    
    func customerType(customer:Customer) -> Int {
        var taste = customer.taste
        if taste < 0.4 {
            return 1
        }
        else if taste >= 0.4 && taste < 0.6 {
            return 2
        }
        else {
            return 3
        }
    }
}