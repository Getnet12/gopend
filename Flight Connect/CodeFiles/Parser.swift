//
//  Parser.swift
//  Flight Connect
//
//  Created by Dinaol Melak on 10/10/20.
//  Copyright © 2020 Dinaol Melak. All rights reserved.
//

import Foundation
import Parse


class parsing{
    let className = "Flyers"
    let flightNumber = "flight_number"
    let sitNumber = "sit_number"
    let interest = "skills"         //[String] in parse, its an array of String
    
    //let dataClassName = "flightsSit"
    let firstName = "Fname"
    let lastName = "Lname"
    let users = "users"
    
    func signUserIn(username: String,pass:String,completion: @escaping(PFUser)->Void){
        PFUser.logInWithUsername(inBackground: username, password: pass) { (pfUser, error) in
            if error != nil{
                print(error as Any)
            }else{
                completion(pfUser!)
            }
        }
        
    }
    func signUserUp(username: String,pass: String, email:String,fname: String, lname:String,hobby:[String]){
        let user = PFUser()
        user.username = username
        user.password = pass
        user.email = email

        // Other fields can be set just like any other PFObject,
        // like this: user["attribute"] = "its value"
        // If this field does not exists, it will be automatically created
        user.signUpInBackground { (success, error) in
            if error != nil{
                print(error as Any)
            }else{
                self.AddUserDataToDB(Fname: fname, Lname: lname, interest: hobby)
                print("Signed Up")
            }
        }
        
        
    }
    
    func AddUserDataToDB(Fname fname:String,Lname lname:String,interest inInterest:[String]){
        let parseObject = PFObject(className:className)
        //   @IBOutlet weak var fname: UITextField!
        //    @IBOutlet weak var sname: UITextField!
        //    @IBOutlet weak var username: UITextField!
        //    @IBOutlet weak var email: UITextField!
        //    @IBOutlet weak var interest: UITextField!

        parseObject[firstName] = fname
        parseObject[lastName] = lname
        //parseObject[users] = PFUser.current()
        parseObject[interest] = inInterest
        
        // Saves the new object.
        parseObject.saveInBackground {
          (success: Bool, error: Error?) in
          if (success) {
            // The object has been saved.
            print("User added to db")
          } else {
            // There was a problem, check error.description
            print(error as Any)
          }
        }
    }
    
    func AddFlightData(inputfNumber: Int, inputsitNumber: String){
        //var parseObject = PFObject(className:"className")

        let parseObject = PFObject(className:className)
        
        
        parseObject[flightNumber] = inputfNumber
        parseObject[sitNumber] = inputsitNumber
        parseObject["username"] = PFUser.current()
        // Saves the new object.
        parseObject.saveInBackground {
          (success: Bool, error: Error?) in
          if (success) {
            // The object has been saved.
            print("saved")
          } else {
            // There was a problem, check error.description
            print(error as Any)
          }
        }
    }
    
    
    
    func listInterestList()->[String]{
        let query = PFQuery(className: className)
        
        
        query.whereKey("username", equalTo: PFUser.current()!)
        query.findObjectsInBackground { (pfobjects, error) in
            if (error != nil){
                print(error)
            }else{
                print(pfobjects as Any)
            }
        }
        return ["one", "two", "three"]
    }
    func getUsersWithInterest(Interest inInterest:String){
        
    }
    func getUserProfile() -> Userinfo{
        let userInfo = Userinfo(fname: "fname", lname: "lname",Email: "email@example.com",username: "Username",Interest: ["Soccer"])
        return userInfo
    }
    
    
    
}
