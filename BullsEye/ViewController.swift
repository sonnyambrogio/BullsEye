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

    //MARK:- ****** Outlets and Connections ******
    
    //MARK: Outlets

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    //MARK: Actions
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
        print("The Value of the slider is \(currentValue)")
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        score += points
        
        let message = "You Scored: \(points) Points"
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    //MARK:- ****** Lifecycle ******

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        
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
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}
