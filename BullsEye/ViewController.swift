//
//  ViewController.swift
//  BullsEye
//
//  Created by xcode on 2018-08-13.
//  Copyright © 2018 nicolehli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var guess = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guess = lroundf(slider.value)
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal") // UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlight = #imageLiteral(resourceName: "SliderThumb-Highlighted") // UIImage(named: "SliderThumb-Highlight")
        slider.setThumbImage(thumbImageHighlight, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackerLeft") // #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizeableImage = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizeableImage, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizeableImage, for: .normal)
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int(arc4random_uniform(100)) + 1 // random 0-99 generated for our slider on 1-100
        guess = 50
        slider.value = Float(guess)
        updateLabel()
    }
    
    func updateLabel() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        // Initial Points Calculation
        let difference = abs(guess - targetValue)
        var points = 100 - difference
        
        // Alert Feedback Message and Bonus
        let feedback: String
        if difference == 0 {
            feedback = "Bulls Eye! Bonus 100 points."
            points += 100
        } else if difference < 5 {
            if difference == 1 {
                points += 50
                feedback = "Off by one! Bonus 50 points."
            } else {
                feedback = "You almost had it!"
            }
        } else if difference < 10 {
            feedback = "Pretty good."
        } else {
            feedback = "Not even close..."
        }
        score += points
        let msg = "You scored \(points) points"
        
        
        let alert = UIAlertController(title: feedback, message: msg, preferredStyle: .alert)
        
        // Swift Closure in handler
        let action = UIAlertAction(title: "Play again!", style: .default, handler: {
            action in
                self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        guess = lroundf(slider.value)
    }
    
    
    
}

