//
//  GameController.swift
//  SlotMachine
//
//  Created by gio emiliano on 2020-01-15.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import UIKit

class GameController {
    
    func reelsEqualy()-> String {
        let random = Int(arc4random_uniform(8)+1)
       
        var image = "blank"
        
        switch random {
            
        case 1:
            
            image = "blank"
            
        case 2:
            
            image = "grapes"
            
        case 3:
            
            image = "apple"
            
        case 4:
            
            image = "pear"
            
        case 5:
            
            image = "cherry"
            
        case 6:
            
            image = "bar"
            
        case 7:
            
            image = "bell"
            
        case 8:
            
            image = "seven"
            
        default:
            
            image = "heart"
            
        }
        
        
        
        return image
        
    }

    
    func reels()-> String{
          
          let random = Int(arc4random_uniform(65)+1)
              //Int.ran
              //.random(in: 0 ..< 65)
          
          
          
        print("Randon number: \(random)")

          var image = "blank"
          
          switch random {
              
          case 1 ... 27:
              
            image = "blank"

              
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
    
    
    func checkElement(name: String, element01: String, element02: String, element03: String) -> Int {
        
        var numberOfElements = 0
        
        if element01 == name { numberOfElements += 1 }
        if element02 == name { numberOfElements += 1 }
        if element03 == name { numberOfElements += 1 }
        
        return numberOfElements
    }
    
    func checkWinning(element01: String, element02: String, element03: String, bet: Int) -> Int {
        
        let blank = checkElement(name: "blank", element01: element01, element02: element02, element03: element03)
        
        let grapes = checkElement(name: "grapes", element01: element01, element02:   element02, element03: element03)
        
        let apple = checkElement(name: "apple", element01: element01, element02: element02, element03: element03)
        
         let pear = checkElement(name: "pear", element01: element01, element02: element02, element03: element03)
        
         let cherry = checkElement(name: "cherry", element01: element01, element02: element02, element03: element03)
        
        let bar = checkElement(name: "bar", element01: element01, element02: element02, element03: element03)
        
        let bell = checkElement(name: "bell", element01: element01, element02: element02, element03: element03)
        
        let seven = checkElement(name: "seven", element01: element01, element02: element02, element03: element03)
        
      
        
        if blank > 0 {
            return 0
        }
        
              if grapes == 3 { return  bet * 10}
              if apple == 3 { return  bet * 20}
              if pear == 3 { return  bet * 30}
              if cherry == 3 { return  bet * 40}
              if bar == 3 { return  bet * 50}
              if bell == 3 { return  bet * 75}
              if seven == 3 { return  bet * 100}

              if grapes == 2 || apple == 2 { return  bet * 2}
              if pear == 2 { return  bet * 3}
              if cherry == 2 { return  bet * 4}
              if bar == 2 { return  bet * 5}
              if bell == 2 { return  bet * 10}
              if seven == 2 { return  bet * 20}
              if seven == 1 { return  bet * 5}

        return bet

    
        
        
    }
    

    
}
