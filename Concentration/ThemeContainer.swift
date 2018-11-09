//
//  ThemeContainer.swift
//  Concentration
//
//  Created by xcode on 02.11.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation
import UIKit

struct ThemeContainer : ThemeProtocol {
    
    
    private var emoji : String
    private var backGroundColor : UIColor
    private var backCardColor : UIColor
    private var activeCardColor : UIColor
    
    init(emoji: String, bgColor: UIColor, bCardColor: UIColor, aCardColor: UIColor) {
        self.emoji = emoji
        backGroundColor = bgColor
        backCardColor = bCardColor
        activeCardColor = aCardColor
    }
    
    func getEmoji() -> String {
        return emoji
    }
    func getBackGroundColor() -> UIColor {
        return backGroundColor
    }
    func getBackCardColor() -> UIColor {
        return backCardColor
    }
    func getActiveColor() -> UIColor {
        return activeCardColor
    }
    
}
