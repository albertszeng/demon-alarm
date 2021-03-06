//
//  LoginViewController.swift
//  demon-alarm
//
//  Created by Albert Zeng on 12/8/16.
//  Copyright © 2016 Albert. All rights reserved.
//  
// 
//  Thanks to twitter for having a bomb API. The code for the twitter button is based on the code they provided

import UIKit
import TwitterKit

class LoginViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var NextView: UIButton!
    
    // function that runs when this view controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create the Twitter login button
        let logInButton = TWTRLogInButton { (session, error) in
            
            // if user is already logged in, enable the button to proceed to alarms table page
            if let unwrappedSession = session {
                let alert = UIAlertController(title: NSLocalizedString("Logged In", comment: "nil"),
                message: NSLocalizedString("User", comment: "nil") + (unwrappedSession.userName) + NSLocalizedString("has logged in", comment: "nil"),
                    preferredStyle: UIAlertControllerStyle.alert
                )
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "nil"), style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                self.NextView.isEnabled = true
                
            } else {
                // if user has not logged in yet, wait for user to log in
                NSLog("Login error: %@", error!.localizedDescription);
            }
        }
        
        // position the Twitter login button
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
