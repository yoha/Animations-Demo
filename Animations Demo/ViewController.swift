//
//  ViewController.swift
//  Animations Demo
//
//  Created by Yohannes Wijaya on 7/9/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var numberOfFish = 0
    
    @IBOutlet weak var numberOfFishSlider: UISlider!
    @IBOutlet weak var numberOfFishLabel: UILabel!
    
    @IBAction func animateButton(sender: UIButton) {
        numberOfFish = Int(numberOfFishSlider.value)
        for _ in 1...numberOfFish {
            // size is set between 10 and 40 pixels
            let fishSize = CGFloat(arc4random_uniform(40)) + 10
            // position on the y-axis is set from 20px off the top to 600px
            let fishPositionAxisY = CGFloat(arc4random_uniform(550)) + 20
            // animation duration is set between 1 and 5 secs.
            let animationDuration = NSTimeInterval(arc4random_uniform(5)) + 1
            // animation delay is set between 0.1 and 0.2 secs.
            let animationDelay = NSTimeInterval(100 + arc4random_uniform(100)) / 1000
            let animationOptions = UIViewAnimationOptions.CurveLinear
            
            let fish = UIImageView(image: UIImage(named: "fish"))
            fish.frame = CGRect(x: 0 - fishSize, y: fishPositionAxisY, width: fishSize, height: fishSize)
            
            self.view.addSubview(fish)
            UIView.animateWithDuration(animationDuration, delay: animationDelay, options: animationOptions, animations: { () -> Void in
                fish.frame = CGRect(x: self.view.frame.size.width, y: fishPositionAxisY, width: fishSize, height: fishSize)
                }) { (Bool) -> Void in
                    fish.removeFromSuperview()
            }
        }
    }
    
    override func viewDidLoad() {
        numberOfFishSlider.continuous = true
        numberOfFishSlider.addTarget(self, action: "updateNumberOfFishLabel", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateNumberOfFishLabel() {
        numberOfFish = Int(numberOfFishSlider.value)
        numberOfFishLabel.text = "Releasing \(numberOfFish) fish(es)"
    }
}

