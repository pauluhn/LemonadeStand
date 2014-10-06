//
//  Weather.swift
//  LemonadeStand
//
//  Created by Paul Uhn on 10/6/14.
//  Copyright (c) 2014 Paul. All rights reserved.
//

import Foundation
import UIKit

class Weather {
    func setupWeather() -> (type:Int, image:UIImage) {
        switch Int(arc4random_uniform(3)) {
        case 0:
            return (0, UIImage(named: "Warm"))
        case 1:
            return (1, UIImage(named: "Mild"))
        default:
            return (2, UIImage(named: "Cold"))
        }
    }
}