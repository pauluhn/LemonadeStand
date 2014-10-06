//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Paul Uhn on 10/5/14.
//  Copyright (c) 2014 Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Inventory
    var supplies = Supplies()
    var weather = Weather().setupWeather()
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var lemonsLabel: UILabel!
    @IBOutlet weak var iceCubesLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    // Purchase
    var price = Price()
    var purchaseLemons = 0
    var purchaseIceCubes = 0
    @IBOutlet weak var purchaseLemonsLabel: UILabel!
    @IBOutlet weak var purchaseIceCubesLabel: UILabel!
    
    // Mixture
    var mixLemons = 0
    var mixIceCubes = 0
    @IBOutlet weak var mixLemonsLabel: UILabel!
    @IBOutlet weak var mixIceCubesLabel: UILabel!

    // Score
    var currentScore = 1
    var highScore = NSUserDefaults.standardUserDefaults().integerForKey("highScore")
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hardReset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    
    // MARK: IBActions
    
    @IBAction func purchaseLemonsPressed(sender: UIButton) {
        if sender.titleLabel!.text == "-" && purchaseLemons > 0 && supplies.lemons > 0{
            purchaseLemons--
            supplies.money += price.lemon
            supplies.lemons--
        }
        else if sender.titleLabel!.text == "+" && supplies.money >= price.lemon {
            purchaseLemons++
            supplies.money -= price.lemon
            supplies.lemons++
        }
        setupView()
    }

    @IBAction func purchaseIceCubesPressed(sender: UIButton) {
        if sender.titleLabel!.text == "-" && purchaseIceCubes > 0 && supplies.iceCubes > 0 {
            purchaseIceCubes--
            supplies.money += price.iceCube
            supplies.iceCubes--
        }
        else if sender.titleLabel!.text == "+" && supplies.money >= price.iceCube {
            purchaseIceCubes++
            supplies.money -= price.iceCube
            supplies.iceCubes++
        }
        setupView()
    }
    
    @IBAction func mixLemonsPressed(sender: UIButton) {
        if sender.titleLabel!.text == "-" && mixLemons > 0 {
            mixLemons--
            supplies.lemons++
        }
        else if sender.titleLabel!.text == "+" && supplies.lemons > 0 {
            mixLemons++
            supplies.lemons--
        }
        setupView()
    }
    
    @IBAction func mixIceCubesPressed(sender: UIButton) {
        if sender.titleLabel!.text == "-" && mixIceCubes > 0 {
            mixIceCubes--
            supplies.iceCubes++
        }
        else if sender.titleLabel!.text == "+" && supplies.iceCubes > 0 {
            mixIceCubes++
            supplies.iceCubes--
        }
        setupView()
    }
    
    @IBAction func startDayButtonPressed(sender: AnyObject) {
        if mixLemons > 0 {
            var lemonade = Lemonade(lemons: mixLemons, iceCubes: mixIceCubes)
            var sales = LemonadeDay().sales(lemonade, weatherType: weather.type)
            supplies.money += sales
            
            if supplies.money >= price.lemon || supplies.lemons > 0 {
                var alertController = UIAlertController(title: "Today's Sales", message: "You made $\(sales) on day \(currentScore)", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
                self.presentViewController(alertController, animated: true, completion:nil)
                currentScore++
                checkHighScore()
                self.reset()
            } else {
                var alertController = UIAlertController(title: "Game Over", message: "You made $\(sales) but you don't have enough money to make tomorrow's lemonade", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
                self.presentViewController(alertController, animated: true, completion:nil)
                self.hardReset()
            }
        }
    }
    
    func checkHighScore() {
        if currentScore > highScore {
            highScore = currentScore
            NSUserDefaults.standardUserDefaults().setInteger(highScore, forKey: "highScore")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
}

extension ViewController {
    
    // MARK: Helpers
    
    func hardReset() {
        supplies = Supplies()
        currentScore = 1
        reset()
    }
    
    func reset() {
        weather = Weather().setupWeather()
        purchaseLemons = 0
        purchaseIceCubes = 0
        mixLemons = 0
        mixIceCubes = 0
        setupView()
    }
    
    func setupView() {
        scoreLabel.text = "\(currentScore)"
        highScoreLabel.text = "\(highScore)"
        
        moneyLabel.text = "$\(supplies.money)"
        lemonsLabel.text = "\(supplies.lemons)"
        iceCubesLabel.text = "\(supplies.iceCubes)"
        weatherImageView.image = weather.image
        
        purchaseLemonsLabel.text = "\(purchaseLemons)"
        purchaseIceCubesLabel.text = "\(purchaseIceCubes)"
        
        mixLemonsLabel.text = "\(mixLemons)"
        mixIceCubesLabel.text = "\(mixIceCubes)"
    }
}
