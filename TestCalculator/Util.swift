//
//  Util.swift
//  TestCalculator
//
//  Created by Fariba Heidari on 1/6/1399 AP.
//  Copyright © 1399 AP Fariba. All rights reserved.
//

import Foundation

extension Double {
    
    var isInteger: Bool { rounded() == self }
    
}




prefix operator %
prefix func % (_ value: Double) -> Double {
    return value*0.01
}

postfix operator ++
postfix func ++ (value: inout Int) {
  value+=1
}


extension String {
    
    var doubleValue: Double {
        get{
            return NSString(string: self).doubleValue
        }
        
    }
    
    var intValue: Int {
        get{
            return Int(NSString(string: self).intValue)
        }
        
    }
    
    var floatValue: Float {
        get{
            return NSString(string: self).floatValue
        }
        
    }
    
}
