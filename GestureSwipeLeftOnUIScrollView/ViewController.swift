//
//  ViewController.swift
//  GestureSwipeLeftOnUIScrollView
//
//  Created by Jatin K Vaishnav on 11/20/15.
//  Copyright © 2015 Jatin K Vaishnav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swipeView: UIScrollView!
    
    private var swipeleftAction: UIAccessibilityCustomAction!
    private var swiperightAction: UIAccessibilityCustomAction!
    
    let swipeleftRec = UISwipeGestureRecognizer()
    let swiperightRec = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        swipeleftRec.direction = .Left
        swipeleftRec.addTarget(self, action: "swipedViewleft")
        swipeView.addGestureRecognizer(swipeleftRec)
        swipeleftAction = UIAccessibilityCustomAction(name: "Swipe Left", target: self, selector: "swipeleftActionActivated")
        
        swiperightRec.direction = .Right
        swiperightRec.addTarget(self, action: "swipedViewright")
        swipeView.addGestureRecognizer(swiperightRec)
        swiperightAction = UIAccessibilityCustomAction(name: "Swipe Right", target: self, selector: "swiperightActionActivated")
        accessibilityCustomActions = [swipeleftAction, swiperightAction]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipedViewright(){
        let swipeAlert = UIAlertController(title: "Swipe Right", message: "Your detailed checking balance consists of two $100 each.", preferredStyle: UIAlertControllerStyle.Alert)
        swipeAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
        self.presentViewController(swipeAlert, animated: true, completion: nil)
    }
    
    func swipedViewleft(){
        let swipeAlert = UIAlertController(title: "Swipe Left", message: "Your summary balance is 600", preferredStyle: UIAlertControllerStyle.Alert)
        swipeAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
        self.presentViewController(swipeAlert, animated: true, completion: nil)
    }
    
    @objc private func swipeleftActionActivated() -> Bool {
        swipedViewleft()
        return true
    }
    
    @objc private func swiperightActionActivated() -> Bool {
        swipedViewright()
        return true
    }

    
}

