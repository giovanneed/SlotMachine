//
//  ViewController.swift
//  SlotMachine
//
//  Created by User on 2020-01-08.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    
    @IBOutlet weak var userMoney: UILabel!
    
    @IBAction func Spin(_ sender: AnyObject) {
        imageOne.image = UIImage(named: reels())
        imageTwo.image = UIImage(named: reels())
        imageThree.image = UIImage(named: reels())
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

