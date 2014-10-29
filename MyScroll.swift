//
//  MyScroll.swift
//  field-build
//
//  Created by grobinson on 10/27/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit

class MyScroll: UIScrollView {
    
    var test = 999
    var animator: UIDynamicAnimator!
    var snaps = [UISnapBehavior]()

    init(frame: CGRect,pview: UIViewController) {
        super.init(frame: frame)
        
        for i in 0...19 {
            
            var new_y = (i*44)+4
            
            var test = UIButton(frame: CGRect(x: 10, y: new_y, width: 40, height: 40))
            test.setTitle("\(i+1)", forState: UIControlState.Normal)
            test.backgroundColor = UIColor.orangeColor()
            self.addSubview(test)
            
        }
        
        self.contentSize.height = (20*44)+4
        self.setContentOffset(CGPoint(x: 0, y: 48), animated: true)
        
        animator = UIDynamicAnimator(referenceView: self)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
