//
//  FirstViewController.swift
//  Kantor
//
//  Created by Admin on 07/02/2018.
//  Copyright © 2018 patisonek. All rights reserved.
//

import UIKit

class ExchangeViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var userAmountTextField: UITextField!
    
    @IBOutlet weak var currencyButton: UIButton!
    
    @IBOutlet weak var exchangeLabel: UILabel!
    
    @IBOutlet  var hideUserInputsButton: UIBarButtonItem!
    
    @IBOutlet weak var currenciesPickerView: UIPickerView!
    
    
    var result:(buy: Float, sell: Float) = (0.0, 0.0)
    
    var kantor = Kantor()
    
    //MARK: View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userAmountTextField.text = "100"
        
        actionUserAmountChanged(userAmountTextField)
        
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(ExchangeViewController.actionHideUserInputs(_:)))
        self.view.addGestureRecognizer(tapGest)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: My Methods
    
    @IBAction func actionHideUserInputs(_ sender: Any) {
        userAmountTextField.resignFirstResponder()
        navigationItem.rightBarButtonItem = nil
    }
    
    
    @IBAction func actionUserAmountChanged(_ sender: Any) {
        
        
        
        let amount = Float(Int(userAmountTextField.text!)! )
        result = kantor.exchange(amount: amount, currencyCode: "EUR")
        
        actionUpdateInterface()
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
    
    // MARK: UITextFieldDelegate Methods

    func textFieldDidBeginEditing(_ textField: UITextField) {
        navigationItem.rightBarButtonItem = hideUserInputsButton
    }
    
    // MARK: UIPickerView Metohods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return kantor.currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var allCods = [String] (kantor.currencies.keys)
        var code = allCods[row]
        
        if let currency = kantor.currencies[code] {
            
            return "\(currency.name) (\(currency.code))"
            
        }
        return ""
        
    }

}

