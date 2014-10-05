//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Paul Uhn on 10/5/14.
//  Copyright (c) 2014 Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let kLemonCost = 2
    let kIceCubeCost = 1
    
    // Inventory
    var money = 10
    var lemons = 1
    var iceCubes = 1
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var lemonsLabel: UILabel!
    @IBOutlet weak var iceCubesLabel: UILabel!
    
    // Purchase
    var purchaseLemons = 0
    var purchaseIceCubes = 0
    @IBOutlet weak var purchaseLemonsLabel: UILabel!
    @IBOutlet weak var purchaseIceCubesLabel: UILabel!
    
    // Mixture
    var mixLemons = 0
    var mixIceCubes = 0
    @IBOutlet weak var mixLemonsLabel: UILabel!
    @IBOutlet weak var mixIceCubesLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    
    // MARK: IBActions
    
    @IBAction func purchaseLemonsPressed(sender: UIButton) {
        if sender.titleLabel!.text == "-" && purchaseLemons > 0 && lemons > 0{
            purchaseLemons--
            money += kLemonCost
            lemons--
        }
        else if sender.titleLabel!.text == "+" && money >= kLemonCost {
            purchaseLemons++
            money -= kLemonCost
            lemons++
        }
        setupView()
    }

    @IBAction func purchaseIceCubesPressed(sender: UIButton) {
        if sender.titleLabel!.text == "-" && purchaseIceCubes > 0 && iceCubes > 0 {
            purchaseIceCubes--
            money += kIceCubeCost
            iceCubes--
        }
        else if sender.titleLabel!.text == "+" && money >= kIceCubeCost {
            purchaseIceCubes++
            money -= kIceCubeCost
            iceCubes++
        }
        setupView()
    }
    
    @IBAction func mixLemonsPressed(sender: UIButton) {
        if sender.titleLabel!.text == "-" && mixLemons > 0 {
            mixLemons--
            lemons++
        }
        else if sender.titleLabel!.text == "+" && lemons > 0 {
            mixLemons++
            lemons--
        }
        setupView()
    }
    
    @IBAction func mixIceCubesPressed(sender: UIButton) {
        if sender.titleLabel!.text == "-" && mixIceCubes > 0 {
            mixIceCubes--
            iceCubes++
        }
        else if sender.titleLabel!.text == "+" && iceCubes > 0 {
            mixIceCubes++
            iceCubes--
        }
        setupView()
    }
    
    @IBAction func startDayButtonPressed(sender: AnyObject) {
    }
}

extension ViewController {
    
    // MARK: Helpers
    
    func setupView() {
        moneyLabel.text = "$\(money)"
        lemonsLabel.text = "\(lemons)"
        iceCubesLabel.text = "\(iceCubes)"
        
        purchaseLemonsLabel.text = "\(purchaseLemons)"
        purchaseIceCubesLabel.text = "\(purchaseIceCubes)"
        
        mixLemonsLabel.text = "\(mixLemons)"
        mixIceCubesLabel.text = "\(mixIceCubes)"
    }
}
