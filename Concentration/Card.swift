//
//  Card.swift
//  Concentration
//
//  Created by Administrator on 21.09.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation

struct Card {

    // MARK: - Properties
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    private static var identifierFactory = 0
    
    // MARK: - Initialization and deinitialization
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }

    // MARK: - Private methods

    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }

}

extension Card: Hashable {

    var hashValue: Int { return identifier }

    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }

}
