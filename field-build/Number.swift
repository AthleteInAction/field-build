//
//  Number.swift
//  field-build
//
//  Created by grobinson on 10/27/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit

class Number: UIView {
    
    var number: Int!
    var animator: UIDynamicAnimator!
    var snaps = [UISnapBehavior]()
    var numberTXT: UILabel!
    
    init(frame: CGRect,n: Int) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.greenColor()
        
        number = n
        
        numberTXT = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))
        numberTXT.text = "\(n)"
        self.addSubview(numberTXT)
        numberTXT.textAlignment = .Center
        
        var shield = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))
        self.addSubview(shield)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        
        
    }
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
        
        
    }
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        
        
        
    }

}
