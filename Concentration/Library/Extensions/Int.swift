//
//  Int.swift
//  Concentration
//
//  Created by Alexander Filimonov on 28/10/2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation

extension Int {
    var acr4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
