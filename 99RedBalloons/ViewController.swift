//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Lynx on 6/24/16.
//  Copyright © 2016 Lynx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var balloonImageView: UIImageView!
    @IBOutlet weak var balloonLabel: UILabel!
    
    
    var balloons : [Balloon] = []
    var currentBalloon: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.createBalloons()
        
        balloonLabel.text = "My number is: \(balloons[currentBalloon].myNumber)"
        balloonImageView.image = UIImage(named: balloons[currentBalloon].imageName)
        currentBalloon += 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createBalloons() {
        for i in 0 ..< 99 {
            var newBalloon = Balloon()
            newBalloon.myNumber = i
            
            let randomNumber = Int(arc4random_uniform(4))
            switch randomNumber {
            case 0:
                newBalloon.imageName = "RedBalloon1.jpg"
            case 1:
                newBalloon.imageName = "RedBalloon2.jpg"
            case 2:
                newBalloon.imageName = "RedBalloon3.jpg"
            case 3:
                newBalloon.imageName = "RedBalloon4.jpg"
            default:
                break
            }
            
            balloons.append(newBalloon)
        }
    }

    @IBAction func nextBalloonButton(sender: UIBarButtonItem) {
        if currentBalloon >= 99 {
            currentBalloon = 0
        }
        let thisBalloon = balloons[currentBalloon]
        
        balloonLabel.text = "My number is: \(thisBalloon.myNumber)"
        balloonImageView.image = UIImage(named: thisBalloon.imageName)
        
        currentBalloon += 1
    }
}

