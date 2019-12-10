//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    var calcBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let formatted = String(format: "%.2fm", sender.value)
        heightLabel.text = formatted
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let formatted = String(format: "%.0fKg", sender.value)
        weightLabel.text = formatted
    }
    
    
    @IBAction func calcPressed(_ sender: UIButton) {
        let h = heightSlider.value
        let w = weightSlider.value
        
        calcBrain.calcBMI(height: h, weight: w)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calcBrain.getBMIValue()
            destinationVC.advice = calcBrain.getAdvice()
            destinationVC.color = calcBrain.getColor()
        }
    }
}

