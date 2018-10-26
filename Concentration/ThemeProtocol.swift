//
//  Theme.swift
//  Concentration
//
//  Created by xcode on 26.10.2018.
//  Copyright © 2018 VSU. All rights reserved.
//
import UIKit
protocol ThemeProtocol {
    func getEmoji() -> String
    func getBackgroundColor() -> UIColor
    func getBackgroundCardColor() -> UIColor
    
    
    /*var natureTheme = "🎄🌳🌵🌴🍃🌾"
    var facesTheme = "🤔🧐🌝🌚🌞🤫"
    var gachiTheme = "👬👩‍❤️‍👩👨‍❤️‍👨👨‍👨‍👦‍👦👨‍👨‍👦👩‍👩‍👧‍👦"
    var oldiTheme = "🧙🏿‍♂️🧙‍♀️🧓🏻👵🎅🏻👴🏾"
    var shipsTheme = "🚢⛴🛳🚤⛵️🛥"
    var trainsTheme = "🚃🚈🚄🚝🚂🚉"*/
}

extension ThemeProtocol {
    func getEmoji() -> String {
        return "🤔🧐🌝🌚🌞🤫"
    }
}



