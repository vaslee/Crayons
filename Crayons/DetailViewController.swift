//
//  DetailViewController.swift
//  Crayons
//
//  Created by TingxinLi on 12/3/18.
//  Copyright © 2018 TingxinLi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var crayon: Crayon!
    @IBOutlet weak var redLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenLabel: UILabel!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var aphlaLabel: UILabel!
    
    @IBOutlet weak var aphlaStepper: UIStepper!
    
    @IBOutlet weak var resetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultBackgroundColor(resetButton)
       
    

    }
    private func updateLabels() {
        redLabel.text = String(format: "%.1f", redSlider.value)
        greenLabel.text = String(format: "%.1f", greenSlider.value)
        blueLabel.text = String(format: "%.1f", blueSlider.value)
        aphlaLabel.text = String(format: "%.1f", aphlaStepper.value)
        
    }
    
    
    private func defaultValues() {
        redSlider.value = Float(crayon.red/255)
        greenSlider.value = Float(crayon.green/255)
        blueSlider.value = Float(crayon.blue/255)
        aphlaStepper.value = 1
        updateLabels()
    }
    
    private func updateColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        let aphla = CGFloat(aphlaStepper.value)
        
        let color = UIColor(displayP3Red: red, green: green, blue: blue, alpha: aphla)
        view.backgroundColor = color
        updateLabels()
    }
    
    
    @IBAction func sliderChanged(_ slider: UISlider){
        updateColor()
       
        
    }
    
    @IBAction func stepperChanged(_ stepper: UIStepper) {
        updateColor()

    }
   
    @IBAction func defaultBackgroundColor(_ button: UIButton){
        view.backgroundColor = crayon.color()
        defaultValues()
        
    }
}
