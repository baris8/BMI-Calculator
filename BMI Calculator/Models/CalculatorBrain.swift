//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Baris Uectas on 24.10.19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi:BMI?
    
    mutating func calcBMI(height:Float, weight:Float){
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, adivce: "Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, adivce: "Fit as a fiddle!", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        }else{
            bmi = BMI(value: bmiValue, adivce: "Eat less pies!", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        }
    }
    
    func getBMIValue() -> String{
        let bmiString = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiString
    }
    
    func getAdvice() -> String{
        return bmi?.adivce ?? "No Advice for you Baby!"
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
