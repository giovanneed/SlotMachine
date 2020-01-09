//
//  ViewController.swift
//  SlotMachine
//
//  Created by User on 2020-01-08.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var playerMoney : Int = 10000
    var bet : Int = 50

    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var playerMoneyLabel: UILabel!
    
    @IBOutlet weak var betMoney: UILabel!
    @IBOutlet weak var userMoney: UILabel!
    
    @IBAction func Spin(_ sender: AnyObject) {
        imageOne.image = UIImage(named: reels())
        imageTwo.image = UIImage(named: reels())
        imageThree.image = UIImage(named: reels())
        
        var result = 0
        //check if win
        if imageOne.image == imageTwo.image, imageTwo.image == imageThree.image {
            print("win")
            result = playerMoney + bet

        } else {
            print("lose")
            result = playerMoney - bet
            
        }
        
        playerMoney = result
        
        playerMoneyLabel.text = String(result)

    }
    
    @IBAction func bet50(_ sender: AnyObject) {
        betMoney.text = "50"
        bet=50
    }
    @IBAction func bet100(_ sender: AnyObject) {
        betMoney.text = "100"
        bet=100
    }
    @IBAction func bet500(_ sender: AnyObject) {
        betMoney.text = "500"
        bet=500
    }
    @IBAction func bet1k(_ sender: AnyObject) {
        betMoney.text = "1000"
        bet=1000
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func reels()-> String{
        
        let random = Int(arc4random_uniform(65)+1)
            //Int.ran
            //.random(in: 0 ..< 65)
        
        
        
        var image = "blank"
        
        switch random {
            
        case 1 ... 27:
            
            print("blank")
            
        case 28 ... 37:
            
            image = "grapes"
            
        case 38 ... 46:
            
            image = "apple"
            
        case 47 ... 54:
            
            image = "pear"
            
        case 55 ... 59:
            
            image = "cherry"
            
        case 60 ... 62:
            
            image = "bar"
            
        case 63 ... 64:
            
            image = "bell"
            
        case 65 ... 65:
            
            image = "seven"
            
        default:
            
            image = "heart"
            
        }
        
        
        
        return image
        
        
        
    }


}

