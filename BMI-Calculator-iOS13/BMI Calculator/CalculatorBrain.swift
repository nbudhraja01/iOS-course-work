//
//  File.swift
//  BMI Calculator
//
//  Created by Navi Budhraja on 6/24/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit
struct CalculatorBrain{
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight/pow(height, 2)

        if(bmiValue < 18.5){
            bmi = BMI(value: bmiValue, advice:"Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if (bmiValue < 24.9){
             bmi = BMI(value: bmiValue, advice:"Fit as a fiddle!", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        } else {
             bmi = BMI(value: bmiValue, advice:"Eat less pies!", color: #colorLiteral(red: 0.6627822518, green: 0, blue: 0.08397576958, alpha: 1))
        }
        
    }
    
    func getBMI() -> String {
        let bmiValue = String(format:"%.1f", bmi?.value ?? 0.0)
        return bmiValue
    }
    
    func getAdvice() -> String {
        return bmi!.advice
    }
    
    func getColor() -> UIColor {
        return bmi!.color
    }
    
}
