//
//  ViewController.swift
//  FB Integration
//
//  Created by THANIKANTI VAMSI KRISHNA on 2/13/20.
//  Copyright © 2020 THANIKANTI VAMSI KRISHNA. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, LoginButtonDelegate {
   
    
    
    
    @IBOutlet weak var lblStatus: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btnFBLogIn = FBLoginButton()
        btnFBLogIn.permissions = ["public_profile","email"]
        btnFBLogIn.delegate = self
        btnFBLogIn.frame = CGRect(x: 106, y: 800, width: 212, height: 40)
        self.view.addSubview(btnFBLogIn)
        
        if AccessToken.current != nil
        {
            self.lblStatus.text = "Logged In"
        }else{
            self.lblStatus.text = "not Logged In"
        }
        
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
           
        if error != nil
        {
            self.lblStatus.text = error!.localizedDescription
        }else if result!.isCancelled{
            self.lblStatus.text = "User cancelled login"
        }else{
            // successful login
            self.lblStatus.text = "User Logged In"
        }
        
    }
       
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
        self.lblStatus.text = "User Logged Out"
           
        
    }


}

