//
//  Brain.swift
//  TestCalculator
//
//  Created by Fariba Heidari on 1/6/1399 AP.
//  Copyright © 1399 AP Fariba. All rights reserved.
//

import Foundation


class Brain {
    
    
    static let operatorDict = ["sign":"+/-","perc":"%","division":"÷","multiply":"✕","minus":"−","sum":"＋","floting_point":"."]

    static func binaryOperation(op1 : Double,op2 : Double?, tappedOperator: String) -> String{
        
        
        var result: Double = 0
        
        
        if tappedOperator == operatorDict["sum"] {
            
            result = op1 + op2!
            
        }else if tappedOperator == operatorDict["minus"] {
            
            result = op1 - op2!
            
        }else if tappedOperator == operatorDict["division"] {
            
            result = op1 / op2!
            
        }else if tappedOperator == operatorDict["multiply"] {
            
            result = op1 * op2!
            
        }
        
        
        if result > 999999999 {
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .scientific
            formatter.positiveFormat = "0.###E+0"
            formatter.exponentSymbol = "e"
            
            if let scientificFormatted = formatter.string(for: result) {
                
                return scientificFormatted
            }
            
            return String(result)
            
        }else {
            
            return result.isInteger ? String(format: "%.0f", result) : String(result)

        }
        
    }
    
    
    
    static func unaryOperation(op1 : Double, tappedOperator: String) -> Double {
        
        var result: Double = 0
        
        if op1 > 0 || op1 < 0 {
            
            if tappedOperator == operatorDict["perc"] {
                
                result = %(op1)
                
            }else if tappedOperator == operatorDict["sign"] {
                
                result = op1  * -1
                
            }
            
            return result
            
        }
        return op1
    }
    
}
