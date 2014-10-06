//
//  Lemonade.swift
//  LemonadeStand
//
//  Created by Paul Uhn on 10/5/14.
//  Copyright (c) 2014 Paul. All rights reserved.
//

import Foundation

struct Lemonade {
    var lemons = 0
    var iceCubes = 0
    
    func ratio() -> Float {
        if iceCubes == 0 {
            return Float(lemons + 1)
        }
        else {
            return Float(lemons) / Float(iceCubes)
        }
    }
}