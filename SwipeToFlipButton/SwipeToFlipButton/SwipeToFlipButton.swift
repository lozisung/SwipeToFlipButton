//
//  SwipeToFlipButton.swift
//  Flex test
//
//  Created by Jason Lo on 11/02/2016.
//  Copyright © 2016 Losoftware. All rights reserved.
//


import UIKit

protocol SwipeToFlipProtocol {
    func swipeButtonTapped()
}

public class SwipeToFlipButton: UIView {
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    var seqArray: NSArray   //array of strings or values for display on label
    var currentItem: Int
    
    var backShowing = false
    var backView: UILabel
    var frontView: UILabel
    
    var delegate: AnyObject!
    var alignment: NSTextAlignment = NSTextAlignment.Center
    var animateDuration: Double = 0.375
    var buttonFont: UIFont = UIFont(name: "Helvetica", size: 14)!
    var backgroundColour: UIColor = UIColor.whiteColor()
    var fontColour: UIColor = UIColor.blackColor()
    var cornerRadius: CGFloat = 0
    var borderColour: UIColor = UIColor.blackColor()
    var borderWidth: CGFloat = 0
    
    public init(frame: CGRect, sequenceArray: NSArray, defaultArrayItem: Int, tapDelegate: AnyObject!) {
        
        seqArray = sequenceArray
        currentItem = defaultArrayItem
        
        backView = UILabel(frame: CGRect(origin: CGPoint(x: 0,y: 0), size: frame.size))
        frontView = UILabel(frame: CGRect(origin: CGPoint(x: 0,y: 0), size: frame.size))
        frontView.text = "\(seqArray[currentItem])"
        
        super.init(frame: frame)
        
        let rightSwipeGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swiped:")
        rightSwipeGesture.direction = UISwipeGestureRecognizerDirection.Right
        let leftSwipeGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swiped:")
        leftSwipeGesture.direction = UISwipeGestureRecognizerDirection.Left
        
        if tapDelegate != nil {
            delegate = tapDelegate
            let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: delegate, action: "swipeButtonTapped")
            self.addGestureRecognizer(tapGesture)
        }
        
        
        self.addGestureRecognizer(rightSwipeGesture)
        self.addGestureRecognizer(leftSwipeGesture)
        self.userInteractionEnabled = true
        
        self.initButton()
        self.addSubview(frontView)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func swiped(sender: AnyObject) {
        if sender.isKindOfClass(UISwipeGestureRecognizer) {
            
            let swipeGesture: UISwipeGestureRecognizer = sender as! UISwipeGestureRecognizer
            
            var showString: String = "\(seqArray[currentItem])"
            print(currentItem)
            
            switch  swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Left:
                print("Swipe left")
                if currentItem > 0 {
                    showString = "\(seqArray[--currentItem])"
                    self.flipView(UIViewAnimationOptions.TransitionFlipFromRight, textString: showString)
                }
                break
            case UISwipeGestureRecognizerDirection.Right:
                print("Swipe right")
                if currentItem + 1 < seqArray.count {
                    showString = "\(seqArray[++currentItem])"
                    self.flipView(UIViewAnimationOptions.TransitionFlipFromLeft, textString: showString)
                }
                break
            default:
                break
                
            }
            
        }
    }
    
    public func initButton () {
        self.backView = self.setupButtonView(self.backView)
        self.frontView = self.setupButtonView(self.frontView)
        
        
    }
    
    func setupButtonView(theView: UILabel) -> UILabel {
        
        theView.clipsToBounds = true
        theView.textAlignment = alignment
        theView.font = buttonFont
        theView.textColor = fontColour
        theView.backgroundColor = backgroundColour
        theView.layer.cornerRadius = cornerRadius
        theView.layer.borderColor = borderColour.CGColor
        theView.layer.borderWidth = borderWidth
        
        return theView
        
        
    }
    
    func flipView(direction: UIViewAnimationOptions, textString: String) {
        
        let fromView : UILabel = backShowing ? backView : frontView
        let toView : UILabel = backShowing ? frontView : backView
        toView.text = textString
        
        UIView.transitionFromView(fromView, toView: toView, duration: animateDuration, options: direction, completion: nil)
        
        backShowing = !backShowing
    }
    
    
}