//
//  ViewController.swift
//  BullsEye
//
//  Created by Sonny Ambrogio on 2015-06-23.
//  Copyright © 2015 Viking Panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- ****** Constants and Variables ******
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0

    //MARK:- ****** Actions and Outlets ******
    
    //MARK: Outlets

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    //MARK: Actions
    
    @IBAction func startOverButton() {
        startNewGame()
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
        print("The Value of the slider is \(currentValue)")
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        let bonusPoints = 100
        var title: String?
        let standardMessage = "You Scored \(points) Points"
        let bonusMessage = "You Scored \(points)!\nAn extra 100 Points have been added as a Bonus for being Perfect"
        var message: String?
        
        if difference == 0 {
            title = "PERFECT!"
            score += bonusPoints
            message = bonusMessage
        } else if difference == 1 {
            title = "1 Away!"
            score += 50
            message = "You Scored \(points) Points!\nAn extra 50 Points have been added as a Bonus for being so close"
        } else if difference < 10 {
            title = "Really Close!"
            message = standardMessage
        } else if difference < 30 {
            title = "Not quite!"
            message = standardMessage
        } else {
            title = "You Suck!"
            message = standardMessage
        }
        
        score += points
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: {action in self.startNewRound()})
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    
    }
    
    //MARK:- ****** Lifecycle ******

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        loadCustomSliderAppearence()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:- ****** Methods ******
    
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
        
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    //MARK:- ****** Slider Appearence ******
    
    func loadCustomSliderAppearence() {
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        
        let thumbImgeHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImgeHighlighted, forState: .Highlighted)
        
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
    }
    
    
    
    
    
    
    
    
    
    
    

}
