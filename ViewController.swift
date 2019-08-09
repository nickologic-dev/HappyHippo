//
//  ViewController.swift
//  Happy Hippo
//
//  Created by Nicole Beilis on 8/8/19.
//  Copyright © 2019 nickelogic. All rights reserved.
//

import UIKit
//import UIKit.UIGestureRecognizerSubclass

class ViewController: UIViewController {
   
    @IBOutlet weak var hippoIImage: UIImageView!
    
    var tapCounter : Int = 0
    var imageArray = ["Hippo1", "Hippo_2", "Hippo_-_3", "Hippo_4", "Hippo_5", "Hippo_6", "Hippo_7", "Hippo_8", "Hippo_9", "Hippo_10", "Hippo_11", "Hippo_12"]
    
    @IBAction func hippoButton(_ sender: UIButton) {
        tapCounter += 1 //tapCounter = tapCounter + 1
        
        if tapCounter == 1 {
            hippoIImage.image = UIImage(named: imageArray[1])
            timeDelay(imageNumber: 2, delay: 0.5)
            runCounter = 0
        }
        else if tapCounter == 2 { //wanted rotation instead
            hippoIImage.image = UIImage(named: imageArray[3])
            var picDelay = 0.5
            for i in 4...6 {
                timeDelay(imageNumber: i, delay: picDelay)
                picDelay += 0.5
                runCounter = 0
            }
        }
        else if tapCounter == 3 {
            hippoIImage.image = UIImage(named: imageArray[7])
            var picDelay = 0.0
            //for _ in 0...100 {
            while true {
                //hippoIImage.image = UIImage(named: imageArray[0])
                print("start")
                for i in 8...11 {
                    timeDelay(imageNumber: i, delay: picDelay)
                    picDelay += 0.4
                    runCounter = 0
                }
                print("end")
                if tapCounter == 4 {
                    break
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        hippoIImage.image = UIImage(named: imageArray[0])
        
    }

    var runCounter = 0
    
    @objc func fireTimer(timer : Timer) {
        if runCounter > 0 {
            timer.invalidate()
        }
        runCounter += 1
    }
    
    @objc func timeDelay (imageNumber : Int, delay : Double) {
        let timer1 = Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { timer in
            self.hippoIImage.image = UIImage(named: self.imageArray[imageNumber])
        }
        fireTimer(timer: timer1)
    }

}

