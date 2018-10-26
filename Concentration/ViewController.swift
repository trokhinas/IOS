//
//  ViewController.swift
//  Concentration
//
//  Created by Administrator on 07.09.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var theme : ThemeProtocol = Theme()
    private var faceColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
    private var backColor = #colorLiteral(red: 0.9529411765, green: 0.7019607843, blue: 0.2588235294, alpha: 1)
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    private var emojiChoices = "👬👩‍❤️‍👩👨‍❤️‍👨👨‍👨‍👦‍👦👨‍👨‍👦👩‍👩‍👧‍👦" // строка с лицевыми символами
    private var emoji = [Card: String]()// эмодзи словарь
    private var numberOfPairsOfCards: Int {//количество пар основанное на количестве карт
        return (cardButtons.count + 1) / 2
    }
    private (set) var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel!{
        didSet {
            updateFlipCountLabel()
        }
    }
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("choosen card is not in cardButton")
        }
    }
    @IBAction private func newGameButton(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
        updateViewFromModel()
        flipCount = 0
        emojiChoices = "👬👩‍❤️‍👩👨‍❤️‍👨👨‍👨‍👦‍👦👨‍👨‍👦👩‍👩‍👧‍👦"
    }
    
    
    
    
    
    
    func updateFlipCountLabel() {
        let attribbutes : [NSAttributedStringKey: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: UIColor.red
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attribbutes)
        flipCountLabel.attributedText = attributedString
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji (for: card), for: UIControlState.normal)
                button.backgroundColor = faceColor
            } else {
                button.setTitle(
                    !card.isMatched ? "❔" : " ", for: UIControlState.normal)
                button.backgroundColor =
                    card.isMatched ? UIColor.clear : backColor
            }
        }
    }
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil,
            emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.acr4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
    
    
    
}



//расширение инта? позволяет инту иметь свойство(?) рандома(?) (вроде так)
extension Int {
    var acr4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
