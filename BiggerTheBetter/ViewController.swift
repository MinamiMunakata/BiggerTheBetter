//
//  ViewController.swift
//  BiggerTheBetter
//
//  Created by minami on 2018-10-01.
//  Copyright © 2018 宗像三奈美. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var scoreLable: UILabel!
    var score:Int = 0
    
    
    override func viewDidLoad() {
        // when all the views are loaded to the memory.
        // 1. generate 2 random numbers
        generateRandomNumbers()

    }
    
    func generateRandomNumbers() {
        let rand1 = arc4random_uniform(100)
        let rand2 = arc4random_uniform(100)
        
        leftButton.setTitle(String(rand1), for: .normal)
        rightButton.setTitle(String(rand2), for: .normal)
    }
    
    // 2. set button action (tap -> increment score)
    @IBAction func leftButtonClicked(_ sender: UIButton) {
        // 3. chack the answer
        checkAnswer(false)
        // 1. generate 2 random numbers
        generateRandomNumbers()
        
    }
    @IBAction func rightButtonClicked(_ sender: UIButton) {
        // 3. chack the answer
        checkAnswer(true)
        // 1. generate 2 random numbers
        generateRandomNumbers()
    }
    
    func checkAnswer(_ isRightBtnClicked: Bool) {
        // get the value from left and right button
        // don't have to repeate if let
        if let leftNumber = leftButton.titleLabel?.text, let rightNumber = rightButton.titleLabel?.text {
            // check if right btn is clicked
            if isRightBtnClicked {
                if Int(leftNumber)! < Int(rightNumber)! { // force unwrap optional
                    // correct
                    score += 1
                    
                } else {
                    //wrong
                    score -= 1
                }
            } else {
                if Int(leftNumber)! > Int(rightNumber)! { // force unwrap optional
                    // correct
                    score += 1
                } else {
                    //wrong
                    score -= 1
                }
            }
        }
        
        // update score and label
        scoreLable.text = "Score: \(score)"
    }

    
}

