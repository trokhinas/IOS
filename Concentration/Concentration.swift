//
//  Concentration.swift
//  Concentration
//
//  Created by Administrator on 21.09.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation

struct Concentration {
    
    private (set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int? = nil
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set (newValue){
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.choosesCard(at: \(index)): choosen index not in the cards") //если кто-то вызовет индекс, например, с -1, то будет это сообщение
        if !cards[index].isMatched {      
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    mutating func shuffle(Array :[Any]) -> Void {
        let c = Array.count
        guard c > 1 else { return }
        var randomIndexes = [Int]()
        var newArray = [Any]()
        for _ in 1...c {
            var index = c.acr4random
            while(randomIndexes.contains(index)) {
                index = c.acr4random
            }
            randomIndexes.append(index)
            newArray.append(Array[index])
        }
        let Array = newArray// не происхождит присваивания в войд функции
        //как перемешать массив передавая его в качестве аргумента?
        
    }
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        shuffle(Array: cards)
    }
    
    
    
    
}
