//
//  ViewController.swift
//  Demo
//
//  Created by Manish Kumar on 4/9/17.
//  Copyright © 2017 Manish Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var logon: UIButton!
    @IBOutlet weak var touchIDImageView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var forgotUserIDOrPassword: UIButton!
   
    
    @IBOutlet weak var imageUserNameVerticalSpacingConstraint: NSLayoutConstraint!
    @IBOutlet weak var userNamePasswordVerticalSpacingConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordLogonSpacingConstraint: NSLayoutConstraint!
    @IBOutlet weak var forgotUserNameTouchIDSpacingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomViewHeightConstraints: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.password.isHidden = true
        self.setUpInitalLayout()
        
    }
    @IBAction func loginTouched(_ sender: Any) {
        //self.animateUserTextField()
        self.animateTouchID()
    }
    
    func animateTouchID(){
   
        let initialSpacing = 40
    
        if (forgotUserNameTouchIDSpacingConstraint != nil){
            forgotUserNameTouchIDSpacingConstraint.isActive = false
        }
    
        if (bottomViewHeightConstraints != nil){
            bottomViewHeightConstraints.isActive = false
        }
    
        NSLayoutConstraint.init(item: self.touchIDImageView,
                          attribute: .top,
                          relatedBy: .equal,
                          toItem: self.forgotUserIDOrPassword,
                          attribute: .bottom,
                          multiplier: 1,
                          constant: CGFloat(initialSpacing + 30)).isActive = true
        
   
        let bottomConstraint = NSLayoutConstraint.init(item: self.bottomView,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: self.view,
                                attribute: .height,
                                multiplier: 0.29166,
                                constant: 0)
    
        bottomConstraint.priority = 250
    
        bottomConstraint.isActive = true
        
    
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.9,
                       options: .beginFromCurrentState,
                       animations: {
                        self.view.layoutIfNeeded()
        },
                       completion: nil)
    }
    
    func setUpInitalLayout(){
        let verticalSpacing = imageUserNameVerticalSpacingConstraint.constant + userNamePasswordVerticalSpacingConstraint.constant + userName.frame.height
        imageUserNameVerticalSpacingConstraint.constant = verticalSpacing
        passwordLogonSpacingConstraint.constant = passwordLogonSpacingConstraint.constant - password.frame.height - logon.frame.height
    }
    func animateUserTextField(){
        let verticalSpacing = imageUserNameVerticalSpacingConstraint.constant - userNamePasswordVerticalSpacingConstraint.constant - userName.frame.height
        imageUserNameVerticalSpacingConstraint.constant = verticalSpacing
        passwordLogonSpacingConstraint.constant = passwordLogonSpacingConstraint.constant + password.frame.height + logon.frame.height
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.4, initialSpringVelocity: 0.9,
                       options: .beginFromCurrentState,
                       animations: {
             self.view.layoutIfNeeded()
        },
                       completion: nil)
        
        self.password.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

