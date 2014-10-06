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
    
    func sales(lemonade:Lemonade, weatherType:Int) -> Int {
        var money = 0
        setupCustomers(weatherType)
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
    
    func setupCustomers(weatherType:Int) {
        let totalCustomers = getTotalCustomers(weatherType)
        for var customerNumber = 0; customerNumber < totalCustomers; customerNumber++ {
            var customer = Customer()
            customer.setupTaste()
            customers.append(customer)
        }
    }
    
    func getTotalCustomers(weatherType:Int) -> Int {
        var totalCustomers = Int(arc4random_uniform(10))
        switch weatherType {
        case 0:
            totalCustomers += 5
        case 2:
            totalCustomers -= 2
        default:
            totalCustomers++
        }
        
        if totalCustomers > 0 {
            return totalCustomers
        } else {
            return 1
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