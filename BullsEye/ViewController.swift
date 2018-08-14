//
//  ViewController.swift
//  BullsEye
//
//  Created by xcode on 2018-08-13.
//  Copyright © 2018 nicolehli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var guess: Int = 0
    @IBOutlet weak var slider: UISlider!
    var targetValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guess = lroundf(slider.value)
        targetValue = Int(arc4random_uniform(100)) + 1 // random 0-99 generated for our slider on 1-100
    }
    
    func startNewRound() {
        targetValue = Int(arc4random_uniform(100)) + 1 // random 0-99 generated for our slider on 1-100
        guess = 50
        slider.value = Float(guess)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        let msg = "The value of the slider is: \(guess) \n The target value is \(targetValue)"
        
        let alert = UIAlertController(title: "Hello, World!", message: msg, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        guess = lroundf(slider.value)
    }
    
    
    
}

