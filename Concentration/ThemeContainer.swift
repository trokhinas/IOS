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
    
    init(emoji: String, bgColor: UIColor, bCardColor: UIColor) {
        self.emoji = emoji
        backGroundColor = bgColor
        backCardColor = bCardColor
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
    
}
