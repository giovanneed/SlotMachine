//
//  MainViewController.swift
//  SlotMachine
//
//  Created by
//  Giovanne Emiliano 301044051
//  Maria Metrina 301089997
//  
//  on 2020-01-15.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import AVFoundation


class MainViewController: UIViewController {
    
    var player: AVAudioPlayer?

    
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet var randomElements: [UIImageView]!
    
    @IBOutlet weak var imageLight: UIImageView!
    
    @IBOutlet weak var labelPlayerMoney: UILabel!
    @IBOutlet weak var labelBet: UILabel!
    
    @IBOutlet weak var firstSlot: UIView!
    @IBOutlet weak var thirdSlot: UIView!
    @IBOutlet weak var secondSlot: UIView!
    
    var firstSlotOriginalFrame = CGRect()
    var secondSlotOriginalFrame = CGRect()
    var thirdSlotOriginalFrame = CGRect()
    
    var element01 = ""
    var element02 = ""
    var element03 = ""
    
    let frameYdelta : CGFloat = 505.0
    

    
    @IBOutlet weak var firstSlotFinalMiddleElementImage: UIImageView!
    @IBOutlet weak var secondSlotFinalMiddleElementImage: UIImageView!
    @IBOutlet weak var thirdSlotFinalMiddleElementImage: UIImageView!
    
    var bet = 500
    var playerMoney = 10000
    
    var gameEndend = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstSlotOriginalFrame = self.firstSlot.frame
        secondSlotOriginalFrame = self.secondSlot.frame
        thirdSlotOriginalFrame = self.thirdSlot.frame
        
        spinButton.setImage(UIImage(named: "pressed_v2_03"), for: .highlighted)
        

        generateRandomElements()
        

        firstSlotFinalMiddleElementImage.image = UIImage(named: GameController().reelsEqualy())
        secondSlotFinalMiddleElementImage.image = UIImage(named: GameController().reelsEqualy())
        thirdSlotFinalMiddleElementImage.image =  UIImage(named: GameController().reelsEqualy())
        
        updateLabels()
             

    }
    
    
    func updateLabels(){
        if  gameEndend {
            labelPlayerMoney.text = "THANK YOU FOR PLAYING!"
            labelBet.text = "SPIN FOR RESTART."
            
            return
        }
        if bet > playerMoney {
            bet = playerMoney
        }
        labelPlayerMoney.text = "PLAYER MONEY: \(playerMoney)"
        labelBet.text = "BET: \(bet)"

    }
    func restartGame(){
        spinButton.isUserInteractionEnabled = true
        bet = 500
        playerMoney = 10000
        gameEndend = false
        updateLabels()
    }
    
    func generateRandomElements(){
        
        for imageElement in randomElements {
            imageElement.image = UIImage(named: GameController().reelsEqualy())

        }
        
    }
    
    @IBAction func spin(_ sender: Any) {
        
        light(on: true)

        
        spinButton.isUserInteractionEnabled = false
        
        playSound(sound: "spinning.mp3")
        
        generateRandomElements()

        
        self.firstSlot.frame = self.firstSlotOriginalFrame
        
        
        element01 = GameController().reels()
        firstSlotFinalMiddleElementImage.image = UIImage(named: element01)


        
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut, animations: {
                 
            var frame = self.firstSlot.frame
            frame.origin.y = frame.origin.y + self.frameYdelta
            self.firstSlot.frame = frame
            
        }, completion: { finished in })
        
        
        self.secondSlot.frame = self.secondSlotOriginalFrame
                                
        element02 = GameController().reels()

        secondSlotFinalMiddleElementImage.image = UIImage(named: element02)
            
              
        UIView.animate(withDuration: 2.3, delay: 0, options: .curveEaseOut, animations: {
                    
            var frame = self.secondSlot.frame
            frame.origin.y = frame.origin.y + self.frameYdelta
            self.secondSlot.frame = frame
              
        }, completion: { finished in})
        
        
        self.thirdSlot.frame = self.thirdSlotOriginalFrame
                    
   
        element03 = GameController().reels()

        thirdSlotFinalMiddleElementImage.image = UIImage(named:element03)

                    
        UIView.animate(withDuration: 3, delay: 0, options: .curveEaseOut, animations: {
            
            var frame = self.thirdSlot.frame
            frame.origin.y = frame.origin.y + self.frameYdelta
            self.thirdSlot.frame = frame
            
        }, completion: { finished in
                        
            if self.gameEndend {
                self.restartGame()
            } else {
                self.checkResult()
            }
        })
        
    }
    
    func checkResult(){
        
        let winning = GameController().checkWinning(element01: element01, element02: element02, element03: element03, bet: bet)
        
        
        if winning > 0 {
            
            playSound(sound: "win.mp3")
            playerMoney += winning
            

        } else {
            playerMoney -= bet

            playSound(sound: "lost.mp3")
            if playerMoney < 1 { gameEndend = true }

        }
        updateLabels()
        spinButton.isUserInteractionEnabled = true
        
        light(on: false)

    }
    
    
    @IBAction func increaseBet(_ sender: Any) {
        playSound(sound: "button-3.mp3")
        
        if (bet + 50) > playerMoney {
            return
        }
        bet += 50
        updateLabels()

    }
    
    @IBAction func decreaseBet(_ sender: Any) {
        playSound(sound: "button-3.mp3")

        
        if (bet - 50) < 0 {
            return
        }
        bet -= 50
        updateLabels()


    }
    @IBAction func betAll(_ sender: Any) {
        playSound(sound: "button-3.mp3")

        
        bet = playerMoney
        updateLabels()
    }
    
    @IBAction func quit(_ sender: Any) {
        playSound(sound: "button-3.mp3")

        
        gameEndend = true
        updateLabels()
    }
    
    func light(on: Bool){
        
        imageLight.alpha = on ? 0 : 1
        
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseOut, animations: {
            self.imageLight.alpha = on ? 1 : 0
        }, completion: { finished in

        })
        
    }
    
    func playSound(sound: String){
        let path = Bundle.main.path(forResource: sound, ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            // couldn't load file :(
        }
    }


}
