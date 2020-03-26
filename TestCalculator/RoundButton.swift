//
//  RoundButton.swift
//  TestCalculator
//
//  Created by Fariba Heidari on 1/6/1399 AP.
//  Copyright © 1399 AP Fariba. All rights reserved.
//

import Foundation
import UIKit


class RoundButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.roundCorner()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        roundCorner()
    }
    
    func roundCorner(){
        
        layer.masksToBounds = false
        clipsToBounds = true
        layer.cornerRadius = frame.width / 2
        
    }
    
}
