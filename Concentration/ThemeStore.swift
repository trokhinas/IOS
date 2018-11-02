//
//  ThemeRandomizer.swift
//  Concentration
//
//  Created by xcode on 02.11.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation
import UIKit

struct ThemeStore : ThemeGeneratorProtocol {
    
    static var currentTheme = 2
    private var natureTheme = "🎄🌳🌵🌴🍃🌾"
    private var facesTheme = "🤔🧐🌝🌚🌞🤫"
    private var gachiTheme = "👬👩‍❤️‍👩👨‍❤️‍👨👨‍👨‍👦‍👦👨‍👨‍👦👩‍👩‍👧‍👦"
    private var oldiTheme = "🧙🏿‍♂️🧙‍♀️🧓🏻👵🎅🏻👴🏾"
    private var shipsTheme = "🚢⛴🛳🚤⛵️🛥"
    private var trainsTheme = "🚃🚈🚄🚝🚂🚉"
    
    
    static private var allThemes : Array<ThemeContainer> = [
         ThemeContainer(emoji: "🎄🌳🌵🌴🍃🌾", bgColor: #colorLiteral(red: 0.01139102657, green: 0.6113474093, blue: 0.0455581384, alpha: 1), bCardColor: #colorLiteral(red: 0.9529411765, green: 0.9362387564, blue: 0.7109183266, alpha: 1)),
         ThemeContainer(emoji: "🤔🧐🌝🌚🌞🤫", bgColor: #colorLiteral(red: 0.5541146643, green: 0.5711302255, blue: 0.9529411765, alpha: 1), bCardColor: #colorLiteral(red: 0.454408904, green: 0.8181438188, blue: 0.9529411765, alpha: 1)),
         ThemeContainer(emoji: "👬👩‍❤️‍👩👨‍❤️‍👨👨‍👨‍👦‍👦👨‍👨‍👦👩‍👩‍👧‍👦", bgColor: #colorLiteral(red: 0.9529411765, green: 0.4441706373, blue: 0.4621701978, alpha: 1), bCardColor: #colorLiteral(red: 0.9529411765, green: 0.8253936142, blue: 0.945636015, alpha: 1)),
         ThemeContainer(emoji: "🧙🏿‍♂️🧙‍♀️🧓🏻👵🎅🏻👴🏾", bgColor: #colorLiteral(red: 0.5065023751, green: 0.1060951702, blue: 0.9529411765, alpha: 1), bCardColor: #colorLiteral(red: 0.9529411765, green: 0.09757192967, blue: 0.8221356422, alpha: 1)),
         ThemeContainer(emoji: "🚢⛴🛳🚤⛵️🛥", bgColor: #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1), bCardColor: #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)),
         ThemeContainer(emoji: "🚃🚈🚄🚝🚂🚉", bgColor: #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1), bCardColor: #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)),
    ]
    
    static func getNewTheme() -> ThemeContainer {
        var newTheme = allThemes.count.acr4random
        while newTheme == currentTheme {
            newTheme = allThemes.count.acr4random
        }
        currentTheme = newTheme
        return allThemes[currentTheme]
    }
    
}
