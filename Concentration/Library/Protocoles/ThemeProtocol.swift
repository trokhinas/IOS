//
//  ThemeProtocol.swift
//  Concentration
//
//  Created by xcode on 02.11.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation
import UIKit

protocol ThemeProtocol {
    
    func getEmoji() -> String
    func getBackGroundColor() -> UIColor
    func getBackCardColor() -> UIColor
}
