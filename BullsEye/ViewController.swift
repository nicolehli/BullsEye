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
    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guess = lroundf(slider.value)
        startNewRound()
    }
    
    func startNewRound() {
        targetValue = Int(arc4random_uniform(100)) + 1 // random 0-99 generated for our slider on 1-100
        guess = 50
        slider.value = Float(guess)
        updateLabel()
    }
    
    func updateLabel() {
        targetLabel.text = String(targetValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let difference: Int = abs(guess - targetValue)
        
        let msg = "The value of the slider is: \(guess)" +
        "\nThe target value is \(targetValue)" +
        "\nThe difference is \(difference)"
        
        let alert = UIAlertController(title: "Hello, World!", message: msg, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        guess = lroundf(slider.value)
    }
    
    
    
}

