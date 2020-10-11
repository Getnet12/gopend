//
//  SignupViewController.swift
//  Flight Connect
//
//  Created by Dinaol Melak on 10/10/20.
//  Copyright © 2020 Dinaol Melak. All rights reserved.
//

import Foundation
import UIKit
import Parse


class SignupViewController: UIViewController {
    @IBOutlet weak var inFnameTextField: UITextField!
    @IBOutlet weak var inSnameTextField: UITextField!
    @IBOutlet weak var inUsername: UITextField!
    @IBOutlet weak var inEmailTextField: UITextField!
    @IBOutlet weak var interest: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passConfirmTextField: UITextField!
    
    let parsy = parsing()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onTapSignIn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapSignUp(_ sender: Any) {
        guard passwordTextField .text == passConfirmTextField.text else {
            return
        }
        var hobby = [String]()
        hobby.append(interest.text!)
        parsy.signUserUp(username: inUsername.text!, pass: passwordTextField.text!, email: inEmailTextField.text!,fname: inFnameTextField.text!,lname: inSnameTextField.text!, hobby: hobby)
        performSegue(withIdentifier: "GoHome", sender: self)
        
    }
    
}
