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
    
    var selectedCurrencyCode: String?
    
    var kantor = Kantor()
    
    //MARK: View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userAmountTextField.text = "100"
        
        actionExchange()
        
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
    
    
    func actionExchange() {
        
        let amount = Float(Int(userAmountTextField.text!)! )
        
        if let code = selectedCurrencyCode {
            
            result = kantor.exchange(amount: amount, currencyCode: code)
            
        }
        else {
            var allCodes = [String] (kantor.currencies.keys)
            if (allCodes.count > 0 ) {
                var code = allCodes[0]
            }
        }
        
        
        actionUpdateInterface()
    }
    
    
    
    @IBAction func actionUserAmountChanged(_ sender: Any) {
        
        actionExchange()
        
        
    }
    
    
    @IBAction func actionUpdateInterface() {
        var displayResult: Float = 0.0
        if (segmentedControl.selectedSegmentIndex == 0){
            displayResult = result.sell
        }
        else {
            displayResult = result.buy
        }
        
        var number = NSNumber(value: displayResult)
        exchangeLabel.text = kantor.currencyFormatter.string(from: number)
        
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var allCodes = [String] (kantor.currencies.keys)
        selectedCurrencyCode = allCodes[row]
        
        if let code = selectedCurrencyCode {
            currencyButton.setTitle(code, for: .normal)
            actionExchange()
        }
    }

}

