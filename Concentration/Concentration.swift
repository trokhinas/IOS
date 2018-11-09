//
//  Concentration.swift
//  Concentration
//
//  Created by Administrator on 21.09.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation

struct Concentration {

    // MARK: - Properties
    
    private (set) var cards = [Card]()
    private var flipCount = 0
    private var scoreCount = 0
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            return cards.indices.filter
                { cards[$0].isFaceUp }.oneAndOnly
        }
        set (newValue) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }

    // MARK: - Initialization and deinitialization

    init(numberOfPairsOfCards: Int) {
        initCards(with: numberOfPairsOfCards)
        cards.shuffle()
    }

    // MARK: - Public methods
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.choosesCard(at: \(index)): choosen index not in the cards") //если кто-то вызовет индекс, например, с -1, то будет это сообщение
        
        if(!(cards[index].isFaceUp || cards[index].isMatched)){
            flipCount += 1;
        }
        if !cards[index].isMatched {      
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {//карты совпали
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    cards[index].isFaceUp = false
                    cards[matchIndex].isFaceUp = false
                    
                    scoreCount += 2
                }
                else {// карты не совпали
                    cards[index].isFaceUp = true
                    if (cards[index].wasFliped){
                        scoreCount -= 1
                    }
                }

            } else {// выбрана лишь 1 карта
                if (cards[index].wasFliped){
                    scoreCount -= 1
                }
                indexOfOneAndOnlyFaceUpCard = index
            }

        }
        cards[index].flip()
    }
    
    mutating func initCards(with numberOfPairsOfCards : Int) {
        assert((numberOfPairsOfCards > 0), "init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    
    
    }
    
    func getFlipCount() -> Int {
        return flipCount
    }
    func getScoreCount() -> Int {
        return scoreCount
    }
}
