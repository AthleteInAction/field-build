//
//  NumberSelector.swift
//  field-build
//
//  Created by grobinson on 10/23/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit

class NumberSelector: UIView {
    
    var selectedNumber: Int!
    var numbers = [Number]()
    var adder: UILabel!
    var p: UIViewController!
    var Scroll: UIScrollView!
    
    init(frame: CGRect,pview: UIViewController) {
        super.init(frame: frame)
        
        p = pview
        
        self.backgroundColor = UIColor.whiteColor()
        
        Scroll = UIScrollView(frame: CGRect(x: 4, y: 4, width: self.bounds.width-52, height: 48))
        self.addSubview(Scroll)
        
        for i in 0..<25 {
            
            var x = (i*40) + (i*4)
            
            var new_i = i
            if i == 3 {new_i = 27}
            
            var button = Number(frame: CGRect(x: x, y: 0, width: 40, height: 40),n: (new_i+1))
            var tap = UITapGestureRecognizer()
            tap.numberOfTapsRequired = 1
            tap.numberOfTouchesRequired = 1
            tap.addTarget(p, action: "numberSelected:")
            tap.addTarget(self, action: "numberTapped:")
            button.tag = new_i+1
            button.userInteractionEnabled = true
            button.addGestureRecognizer(tap)
            Scroll.addSubview(button)
            
            self.numbers.append(button)
            
        }
        
        Scroll.contentSize.width = CGFloat((numbers.count*44)-4)
        
        var addPan = UIPanGestureRecognizer()
        addPan.cancelsTouchesInView = false
        self.adder = UILabel(frame: CGRect(x: self.bounds.width-44, y: 4, width: 40, height: 40))
        self.adder.backgroundColor = UIColor.yellowColor()
        self.adder.text = "ADD"
        self.adder.textAlignment = .Center
        self.adder.userInteractionEnabled = true
        self.addSubview(self.adder)
        addPan.addTarget(self, action: "addPanRec:")
        addPan.maximumNumberOfTouches = 1
        addPan.minimumNumberOfTouches = 1
        self.adder.addGestureRecognizer(addPan)
        
        orderNumbers(999999)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        
    }
    
    func numberTapped(item: UITapGestureRecognizer){
        
        clear()
        item.view?.backgroundColor = UIColor.whiteColor()
        NSLog("TAG: \(item.view?.tag)")
        
    }
    
    func clear(){
        
        for item in numbers {
            
            item.backgroundColor = UIColor.greenColor()
            selectedNumber = nil
            
        }
        
    }
    
    func addPanRec(item: UIPanGestureRecognizer){
        
        var t: CGPoint = item.translationInView(self)
        var l: CGPoint = item.locationInView(self)
        
        var a = round(sqrt((pow(abs(t.x),2) + pow(abs(t.y),2))))
        
        if a > 60 {
            
            var num = Int(round((a-60)/7))
            if num == 0 {num = 1}
            
            adder.text = "\(num)"
            
        } else {
            
            adder.text = "ADD"
            
        }
        
        NSLog("x: \(l.x)|y: \(l.y) ::: x: \(t.x)|y: \(t.y) ::: Dist: \(a)")
        
        if item.state == UIGestureRecognizerState.Ended {
            
            if adder.text == "ADD" {
                
                
                
            } else {
                
                addNumber(adder.text!)
                
            }
            
            adder.text = "ADD"
            
        }
        
    }
    
    
    func addNumber(num: String){
        
        var CLEAN = true
        
        for n in numbers {
            
            var new_n = "\(n.number)"
            if new_n == num {
                
                CLEAN = false
                
            }
            
        }
        
        if CLEAN {
            
            var button = Number(frame: CGRect(x: Scroll.contentSize.width+88,y: 0,width: 40,height: 40),n: num.toInt()!)
            var tap = UITapGestureRecognizer()
            tap.numberOfTapsRequired = 1
            tap.numberOfTouchesRequired = 1
            tap.addTarget(p, action: "numberSelected:")
            tap.addTarget(self, action: "numberTapped:")
            button.userInteractionEnabled = true
            button.addGestureRecognizer(tap)
            Scroll.addSubview(button)
            numbers.append(button)
            
            orderNumbers(button.number)
            
        }
        
    }
    
    func orderNumbers(num: Int){
        
        var scrollPos: Int!
        
        /////////// Num,Key ///
        var tmp: [[Int]] = []
        
        var i = 0 as Int
        for n in numbers {
            
            var key = n.number
            tmp.append([key,i])
            
            i++
            
        }
        
        tmp.sort {$0[0] < $1[0]}
        
        var new_numbers = [Number]()
        
//        animator.removeAllBehaviors()
//        snaps = [UISnapBehavior]()
//        NSLog("SNAPS: \(snaps.count)")
        
        i = 0
        for n in tmp {
            
            var new_x = (i*44)+20
            
//            snaps.append(UISnapBehavior(item: numbers[n[1]], snapToPoint: CGPoint(x: next_x, y: 20)))
//            animator.addBehavior(snaps.last)
            numbers[n[1]].center.x = CGFloat(new_x)
            
            if n[0] == num {
                scrollPos = i
            }
            
            i++
            
        }
        
        Scroll.contentSize.width = CGFloat((numbers.count*44)-4)
        if scrollPos != nil {
            
            scrollto(scrollPos)
            
        }
        
    }
    
    
    func scrollto(num: Int){
        
        var nf: CGFloat = (44*(CGFloat(num)-1)) - ((Scroll.bounds.width/2)-20)
        var max = Scroll.contentSize.width - Scroll.bounds.width
        
        if nf > max {
            nf = max
        }
        if nf < 0 {
            nf = 0
        }
        
        Scroll.contentOffset.x = nf
        
    }

}
