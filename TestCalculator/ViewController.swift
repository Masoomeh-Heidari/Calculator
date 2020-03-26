//
//  ViewController.swift
//  TestCalculator
//
//  Created by Fariba Heidari on 1/4/1399 AP.
//  Copyright © 1399 AP Fariba. All rights reserved.
//

import UIKit


let LABEL_MAX_SIZE = 9

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var zeroBtn: UIButton!
    
    private var firstNumber :Double?
    private var secondNumber :Double?
    
    private var isOperatorTapped : Bool = false
    
    private var tappedOperator :String?
    
    private var isDecimalNumber = false
    
    private var counter = 0 // Limit lenght of input to LABEL_MAX_SIZE
    
    
    private var displayValue : String? {
        
        willSet {
            
            label.text = newValue
        }
        
    }
    
    private var history : String? = "0" {
        
        willSet {
            
            displayValue = newValue
        }
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        label.adjustsFontSizeToFitWidth = true
        
        configUI()
        
    }
    
    @IBAction func numberPadAction(_ sender: UIButton) {
        
        if let title = sender.currentTitle {
            
            switch title {
                
            case "AC": //Clear display
                
                self.resetDisplay()
                
            case "÷","✕","−","＋"://BinaryOperation
                
                self.perfomBinaryOperation(title)
                
            case "+/-","%"://UnaryOperation
                
                self.performUnaryOperation(title)
                
            case "."://Add floating_point
                
                self.isDecimalNumber ?():self.appendText(text: title)
                
            case "＝"://PerformOperation
                                
                self.perfomBinaryOperation(nil)
                
            default:
                self.appendText(text: title)
                
            }
        }
    }
    
}

extension ViewController {
    
    private func appendText(text :String) {
                
        if let currentValue = label.text , counter < LABEL_MAX_SIZE {
            
            if text == "." {
                
                self.isDecimalNumber = true
            }
            
            if isOperatorTapped {
                
                self.isOperatorTapped = false
                self.history = text
                
            }else {
                self.history = currentValue.doubleValue == 0 ? text : currentValue+text
                
            }
            
        }
    
        counter++
        
    }
    
    private func resetCalculator(){
        
        self.firstNumber = nil
        self.secondNumber = nil
        self.tappedOperator = nil
        self.isOperatorTapped = false
        self.isDecimalNumber = false
        
    }
    
    private func resetDisplay(){
        
        self.resetCalculator()
        self.history = "0"
        
    }
    
    private func perfomBinaryOperation(_ title :String?){
        
        counter = 0

        if let opr = title {//chain of operation
            
            self.firstNumber = self.displayValue?.doubleValue
            
            self.isOperatorTapped = true
            self.tappedOperator = opr
            
        }else {
            
            self.secondNumber = self.displayValue?.doubleValue
            
            self.history = Brain.binaryOperation(op1: firstNumber!, op2: secondNumber!, tappedOperator: tappedOperator!)
            
            self.firstNumber = history?.doubleValue
            
            self.secondNumber = nil
            
            self.isOperatorTapped = false
            
        }
    }
    
    private func performUnaryOperation(_ title : String) {
        
        let result = Brain.unaryOperation(op1: (displayValue?.doubleValue)! , tappedOperator: title)

        self.displayValue = result.isInteger ? String(format: "%.0f", result) : String(result)

        self.history = displayValue
    }
    
    func configUI(){
        zeroBtn.layer.masksToBounds = false
        zeroBtn.clipsToBounds = true
        zeroBtn.layer.cornerRadius = zeroBtn.frame.size.height/2
        
    }
    
}
