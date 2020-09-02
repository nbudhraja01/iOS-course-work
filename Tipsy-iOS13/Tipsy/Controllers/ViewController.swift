//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    var tipValue:Float = 0.0
    
    var splitValue:Float = 2.0
    
    var splitFinal:Float = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        twentyPctButton.isSelected = false
        tenPctButton.isSelected = false
        sender.isSelected = true
        
        if(sender.currentTitle=="0%"){
            tipValue = 0.0
        } else if (sender.currentTitle=="10%"){
            tipValue = 0.1
        } else {
             tipValue = 0.2
        }
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitValue = Float(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let userTotal:String = billTextField.text ?? "0.0"
        
        let bill = ( userTotal as NSString).floatValue
        
        var total = bill
        
        if(tipValue != 0.0){
            total += bill * tipValue
        }
        
         splitFinal = total/splitValue
        
        self.performSegue(withIdentifier: "resultSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.result = String(format:"%.2f", splitFinal)
        destinationVC.totalPeople = String(format:"%.0f", splitValue)
        destinationVC.tipPercentage = String(format:"%.0f", tipValue*100)
    }
    
    
    
}

