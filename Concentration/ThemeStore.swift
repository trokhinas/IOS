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
        ThemeContainer(emoji: "🎄🌳🌵🌴🍃🌾", bgColor: #colorLiteral(red: 0.9529411765, green: 0.9362387564, blue: 0.7109183266, alpha: 1), bCardColor: #colorLiteral(red: 0.01139102657, green: 0.6113474093, blue: 0.0455581384, alpha: 1), aCardColor: #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 0.4)),
        ThemeContainer(emoji: "🤔🧐🌝🌚🌞🤫", bgColor: #colorLiteral(red: 0.5541146643, green: 0.5711302255, blue: 0.9529411765, alpha: 1), bCardColor: #colorLiteral(red: 0.454408904, green: 0.8181438188, blue: 0.9529411765, alpha: 1), aCardColor: #colorLiteral(red: 0.454408904, green: 0.8181438188, blue: 0.9529411765, alpha: 0.4)),
         ThemeContainer(emoji: "👬👩‍❤️‍👩👨‍❤️‍👨👨‍👨‍👦‍👦👨‍👨‍👦👩‍👩‍👧‍👦", bgColor: #colorLiteral(red: 0.4028789416, green: 0.4004078564, blue: 0.7206046916, alpha: 1), bCardColor: #colorLiteral(red: 0.7206046916, green: 0.5987158024, blue: 0, alpha: 1),  aCardColor: #colorLiteral(red: 0, green: 0.7206046916, blue: 0.2792264415, alpha: 0.33)),
         ThemeContainer(emoji: "🧙🏿‍♂️🧙‍♀️🧓🏻👵🎅🏻👴🏾", bgColor: #colorLiteral(red: 0.6334836597, green: 0.2871732787, blue: 1, alpha: 1), bCardColor: #colorLiteral(red: 0.9529411765, green: 0.7496631891, blue: 0.01391786021, alpha: 1),  aCardColor: #colorLiteral(red: 0, green: 1, blue: 0.6817751333, alpha: 0.33)),
         ThemeContainer(emoji: "🚢⛴🛳🚤⛵️🛥", bgColor: #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1) , bCardColor: #colorLiteral(red: 0.5807225108, green: 0.3104923156, blue: 0.2825462655, alpha: 1),  aCardColor:#colorLiteral(red: 0.3275205181, green: 0.3009185654, blue: 0.5807225108, alpha: 0.33) ),
         ThemeContainer(emoji: "🚃🚈🚄🚝🚂🚉", bgColor: #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1), bCardColor: #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1),  aCardColor: #colorLiteral(red: 0.2058772392, green: 0.003170025788, blue: 1, alpha: 0.33)),
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
