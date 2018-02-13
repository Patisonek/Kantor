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
    
    var result:(buy: Float, sell: Float) = (0.0, 0.0)
    
    @IBAction func actionHideUserInputs(_ sender: Any) {
        userAmountTextField.resignFirstResponder()
        navigationItem.rightBarButtonItem = nil
    }
    
    
    @IBAction func actionUserAmountChanged(_ sender: Any) {
        
    }
    
    
    @IBAction func actionUpdateInterface() {
        var displayResult: Float = 0.0
        if (segmentedControl.selectedSegmentIndex == 0){
            displayResult = result.sell
        }
        else {
            displayResult = result.buy
        }
        exchangeLabel.text = "\(displayResult)"
        
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

