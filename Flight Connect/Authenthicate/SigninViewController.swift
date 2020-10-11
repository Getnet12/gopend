//
//  ViewController.swift
//  Flight Connect
//
//  Created by Dinaol Melak on 10/9/20.
//  Copyright © 2020 Dinaol Melak. All rights reserved.
//

import UIKit
import Parse

class SigninViewController: UIViewController {
    var parsy = parsing()
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTapSignIn(_ sender: Any) {
//        guard username != nil && password != nil else {
//            return
//        }
        parsy.signUserIn(username: username.text!, pass: password.text!) { (pfuser) in
            print("Success Sign in")
            self.performSegue(withIdentifier: "SignedIn", sender: self)
            
        }
    }
    
    @IBAction func onTapSignUp(_ sender: Any) {
        performSegue(withIdentifier: "GoSignUp", sender: self)
    }
}

