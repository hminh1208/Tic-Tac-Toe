//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by minh phan on 11/11/14.
//  Copyright (c) 2014 minh phan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var goNumber = 1
    
    // 0 = empty 1 = o 2 = x
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winner = 0
    
    let winningCombination = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if(gameState[sender.tag] == 0 && winner == 0){
            
            var image = UIImage()
            
            if (goNumber % 2 == 0){
                image = UIImage(named: "x.png")!
                gameState[sender.tag] = 2
            }else{
                image = UIImage(named: "o.png")!
                gameState[sender.tag] = 1
            }
            
            for combination in winningCombination {
                if (gameState[combination[0]] == gameState[combination[1]] && gameState[combination[0]] == gameState[combination[2]] && gameState[combination[0]] != 0){
                    
                    winner = gameState[combination[0]]
                    
                }
            }
            
            if (winner != 0 && goNumber < 9){
                if (winner == 1){
                    label.text = "o is winner!"
                }else{
                    label.text = "x is winner!"
                }
                
                UIView.animateWithDuration(0.5, animations: {
                    self.label.alpha = 1
                    self.playAgain.alpha = 1
                })
            }else if(winner == 0 && goNumber == 9){
                label.text = "Draw!"
                
                UIView.animateWithDuration(0.5, animations: {
                    self.label.alpha = 1
                    self.playAgain.alpha = 1
                })
            }
            
            
            
            goNumber++
            
            sender.setImage(image, forState: .Normal)
        }
        
    
    }
    
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        goNumber = 1
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        winner = 0
        
        UIView.animateWithDuration(0.5, animations: {
            self.label.alpha = 0
            self.playAgain.alpha = 0
        })

        var button:UIButton
        for var i = 0; i < 9; i++ {
            button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

