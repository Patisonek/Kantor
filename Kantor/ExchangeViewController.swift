//
//  FirstViewController.swift
//  Kantor
//
//  Created by Admin on 07/02/2018.
//  Copyright © 2018 patisonek. All rights reserved.
//

import UIKit

class ExchangeViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var userAmountTextField: UITextField!
    
    @IBOutlet weak var currencyButton: UIButton!
    
    @IBOutlet weak var exchangeLabel: UILabel!
    
    @IBOutlet  var hideUserInputsButton: UIBarButtonItem!
    
    @IBAction func actionHideUserInputs(_ sender: Any) {
        userAmountTextField.resignFirstResponder()
        navigationItem.rightBarButtonItem = nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userAmountTextField.text = "100"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        navigationItem.rightBarButtonItem = hideUserInputsButton
    }
    
    

}

