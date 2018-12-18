//
//  PasswordGenerator.swift
//  InClass04
//
//  Created by Prerana Singh on 11/2/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//

import Foundation

class PasswordGenerator{
    var num:Int = 0
    var passwordLength:Int = 0
    
    
    init(num:Int,passwordLength:Int){
        self.num = num
        self.passwordLength = passwordLength
    }
    
    init(){}
    
    var description:String{
        return "\(num),\(passwordLength)"
    }
}
