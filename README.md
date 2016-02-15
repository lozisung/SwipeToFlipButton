# SwipeToFlipButton
Simple flip view which increments/decrements through an array's values with a left or right swipe

USAGE:

SwipeToFlipButton(frame: CGRect, sequenceArray: NSArray, defaultArrayItem: Int)

where sequenceArray is the sequence to step through ie 1,2,3,4,5 and defaultArrayItem is the currently displayed index item.

OPTIONS: 

.animationDuration to change speed of animation, default is 0.375.
.alignment to change NSTextAlignment
.backgroundColour to change label backgroundColor
.buttonFont to change UIFont of label
.fontColour to change text colour