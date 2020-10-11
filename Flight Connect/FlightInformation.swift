//
//  FlightInformation.swift
//  Flight Connect
//
//  Created by Dinaol Melak on 10/10/20.
//  Copyright © 2020 Dinaol Melak. All rights reserved.
//

import Foundation
import Parse
import UIKit

class FlightInformation: UIViewController {
    
    @IBOutlet weak var flightNumberTextField: UITextField!
    @IBOutlet weak var sitNumberTextField: UITextField!
    let parsy = parsing()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func didTapConnect(_ sender: Any) {
        parsy.AddFlightData(inputfNumber: Int(flightNumberTextField.text!)!, inputsitNumber: sitNumberTextField.text!)
        performSegue(withIdentifier: "AddedFlight", sender: self)
    }
    
}
