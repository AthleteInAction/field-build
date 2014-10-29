//
//  ViewController.swift
//  numbers
//
//  Created by grobinson on 10/22/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var awayNumbers: NumberSelector!
    var homeNumbers: NumberSelector!
    
    var field: FieldClass!
    var ratio: CGFloat!
    
    @IBOutlet weak var fieldIMG: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratio = fieldIMG.bounds.width/124
        
        field = FieldClass(frame: CGRect(x: (ratio*2), y: (fieldIMG.center.y-(fieldIMG.bounds.height/2))+(ratio*2), width: (ratio*120), height: (fieldIMG.bounds.height-(ratio*4))),pview: self)
        view.addSubview(field)
        
        awayNumbers = NumberSelector(frame: CGRect(x: 0, y: field.center.y-(field.bounds.height/2)-68, width: view.bounds.width, height: 48),pview: self)
        view.addSubview(awayNumbers)
        
        homeNumbers = NumberSelector(frame: CGRect(x: 0, y: (field.center.y+(field.bounds.height-(field.bounds.height/2)))+20, width: view.bounds.width, height: 48),pview: self)
        view.addSubview(homeNumbers)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // CLOSEST YARD
    func snapX(num: CGFloat) -> CGFloat {
        
//        var snap_x = round(num/ratio)*ratio
//        
//        return snap_x
        return 0
        
    }
    
    // YARDS TO PIXELS
    func yard(num: CGFloat) -> CGFloat {
        
//        var pixels = num*ratio
//        
//        return pixels
        return 0
        
    }
    
    func numberSelected(item: UITapGestureRecognizer){
        
        if item.state == UIGestureRecognizerState.Began {
            
            NSLog("TAP BEGAN")
            
        }
        
        if item.state == UIGestureRecognizerState.Ended {
            
            NSLog("TAP ENDED")
            
        }
        
        if item.state == UIGestureRecognizerState.Cancelled {
            
            NSLog("TAP CANCELLED")
            
        }
        
    }
    
    
    func fieldDragged(item: UIPanGestureRecognizer){
        
        if item.state == UIGestureRecognizerState.Ended || item.state == UIGestureRecognizerState.Cancelled {
            
            awayNumbers.clear()
            homeNumbers.clear()
            
        }
        
    }
    
}