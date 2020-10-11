//
//  Userfile.swift
//  Flight Connect
//
//  Created by Dinaol Melak on 10/10/20.
//  Copyright © 2020 Dinaol Melak. All rights reserved.
//

import Foundation


class Userinfo{
    var fname = ""
    var sname = ""
    var email = ""
    var username = ""
    var interest = [String]()
    
    init (fname fName:String,lname lName:String, Email inEmail:String,username inUser:String,Interest inInterest:[String]) {
        fname = fName
        sname = lName
        username = inUser
        email = inEmail
        interest = inInterest
    }
    
}
