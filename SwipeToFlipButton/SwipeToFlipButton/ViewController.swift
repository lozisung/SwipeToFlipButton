//
//  ViewController.swift
//  SwipeToFlipButton
//
//  Created by Jason Lo on 12/02/2016.
//  Copyright © 2016 losoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SwipeToFlipProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let topButton: SwipeToFlipButton = SwipeToFlipButton(frame: CGRect(x: 30, y: 40, width: 40, height: 40), sequenceArray: [1,2,3,4,5], defaultArrayItem: 2)
        //        topButton = SwipeToFlipButton(frame: CGRect(x: 10, y: 40, width: 40, height: 40))
        topButton.animateDuration = 0.25
        
        self.view.addSubview(topButton)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipeButtonTapped() {
        print("swipeButtonTapped")
    }


}

