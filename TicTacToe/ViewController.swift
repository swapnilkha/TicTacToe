//
//  ViewController.swift
//  TicTacToe
//
//  Created by Swapnil Kha on 5/13/17.
//  Copyright © 2017 Swapnil Kha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer = 1
    var gameGrid = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winCombos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var isGameActive = true
    
    @IBOutlet weak var Label: UILabel!
    

    @IBAction func action(_ sender: AnyObject) {
        
        if(gameGrid[sender.tag - 1] == 0 && isGameActive == true) {
            gameGrid[sender.tag - 1] = currentPlayer
            if(currentPlayer == 1) {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                currentPlayer = 2
            }
            else {
                sender.setImage(UIImage(named: "Circle.png"), for: UIControlState())
                currentPlayer = 1
            }
        }
        
        for combos in winCombos {
            
            if(gameGrid[combos[0]] != 0 && gameGrid[combos[0]] == gameGrid[combos[1]] && gameGrid[combos[1]] == gameGrid[combos[2]]) {
                isGameActive = false
                if(gameGrid[combos[0]] == 1) {
                    Label.text = "CROSS WINS!"
                }
                else {
                    Label.text = "CIRCLE WINS!"
                }
                playAgainButton.isHidden = false
                Label.isHidden = false
                
            }
        }
        
        var count = 1

        if (isGameActive == true) {
            for i in gameGrid {
                count = i * count
            }
            if(count != 0) {
                Label.text = "IT WAS A DRAW!"
                Label.isHidden = false
                playAgainButton.isHidden = false
            }
        }
    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: AnyObject) {
        gameGrid = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        isGameActive = true
        currentPlayer = 1
        playAgainButton.isHidden = true
        Label.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
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

