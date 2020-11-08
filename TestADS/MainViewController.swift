//
//  ViewController.swift
//  TestADS
//
//  Created by Sarah Hebert on 2020-11-07.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var scrollViewStackView: UIStackView!
    
    var isMenuHidden = true
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Observer for a button tap
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(notificationObserver(notification:)),
                                               name: .buttonTap,
                                               object: nil)
        
        self.addSwipeGesture()
    }
    
    //Create and add gesture recognizer for the blue menu
    private func addSwipeGesture() {
        
        let leftSwipe = UISwipeGestureRecognizer(target: self,
                                                 action: #selector(self.swipeMade(_:)))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self,
                                                  action: #selector(self.swipeMade(_:)))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    //Show or hide the blue menu depending on the gesture
    @objc func swipeMade(_ sender: UISwipeGestureRecognizer) {
        
        if sender.direction == .right && self.isMenuHidden == true {
            let vc = MenuViewController()
            self.addChild(vc)
            
            vc.view.frame = CGRect(x: self.view.frame.minX,
                                   y: self.view.frame.minY,
                                   width: 170,
                                   height: self.view.frame.height)
            vc.view.tag = 1000
            self.view.addSubview(vc.view)
            self.isMenuHidden = false
            
        } else if sender.direction == .left && self.isMenuHidden == false {
            if let viewWithTag = self.view.viewWithTag(1000) {
                viewWithTag.removeFromSuperview()
                self.isMenuHidden = true
            }  
        }
    }
    
    @IBAction func buttonTap() {
        
        NotificationCenter.default.post(name: .buttonTap, object: nil)
    }
    
    @objc private func notificationObserver(notification: NSNotification) {
        
        self.addDateLabel(notification: notification)
    }
}

//MARK: DateLabelProtocol Extension
extension MainViewController: DateLabelProtocol {
    
    var stackView: UIStackView? {
        get {
            return self.scrollViewStackView
        }
    }
}
