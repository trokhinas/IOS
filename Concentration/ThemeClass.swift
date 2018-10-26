//
//  ThemeClass.swift
//  Concentration
//
//  Created by xcode on 26.10.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation
import UIKit

class Theme: ThemeProtocol {
    private var numOfTheme = 6
    private var natureTheme = "🎄🌳🌵🌴🍃🌾"
    private var facesTheme = "🤔🧐🌝🌚🌞🤫"
    private var gachiTheme = "👬👩‍❤️‍👩👨‍❤️‍👨👨‍👨‍👦‍👦👨‍👨‍👦👩‍👩‍👧‍👦"
    private var oldiTheme = "🧙🏿‍♂️🧙‍♀️🧓🏻👵🎅🏻👴🏾"
    private var shipsTheme = "🚢⛴🛳🚤⛵️🛥"
    private var trainsTheme = "🚃🚈🚄🚝🚂🚉"
    
    
    func getEmoji() -> String {
        return "🚢⛴🛳🚤⛵️🛥"
    }
    
    func getBackgroundColor() -> UIColor {
        return UIColor.red
    }
    
    func getBackgroundCardColor() -> UIColor {
        return UIColor.black
    }
    
}
