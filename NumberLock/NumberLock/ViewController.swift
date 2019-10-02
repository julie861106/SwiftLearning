//
//  ViewController.swift
//  NumberLock
//
//  Created by Julie Yao on 2019/3/31.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    var answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100)+1
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var background: UIImageView!
    
    @IBAction func makeAGuess(_ sender: UIButton) {
        
        if isOver == false{
            
            print(answer)
            let inputText = inputTextField.text!
            inputTextField.text = ""
            
            let inputNumber = Int(inputText)
            if inputNumber == nil{
                messageLabel.text = "No input! Guess a number between \(minNumber) ~ \(maxNumber)"
            }else{
                if inputNumber! > 100{
                    messageLabel.text = "Too large! Guess a number between \(minNumber) ~ \(maxNumber)"
                }else if inputNumber! < 1{
                    messageLabel.text = "Too small! Guess a number between \(minNumber) ~ \(maxNumber)"
                }else if inputNumber! == answer{
                    messageLabel.text = "You are right! Press [Guess] to play again."
                    isOver = true
                    background.image = UIImage(named: "Finish")
                }else{
                    if inputNumber! < answer{
                        minNumber = inputNumber!
                    }else{
                        maxNumber = inputNumber!
                    }
                    messageLabel.text = "Try again! Guess a number between \(minNumber) ~ \(maxNumber)"
                }
            }
        }else{
            maxNumber = 100
            minNumber = 1
            messageLabel.text = "Guess a number between \(minNumber) ~ \(maxNumber)"
            answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100)+1
            isOver = false
            background.image = UIImage(named: "BG")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //讓鍵盤跳出
        inputTextField.becomeFirstResponder()
        
    }


}

