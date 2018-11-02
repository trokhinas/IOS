//
//  Collection.swift
//  Concentration
//
//  Created by xcode on 02.11.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
