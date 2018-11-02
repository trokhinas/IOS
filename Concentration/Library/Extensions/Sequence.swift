//
//  Sequence.swift
//  Concentration
//
//  Created by xcode on 02.11.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation

extension Sequence {
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
