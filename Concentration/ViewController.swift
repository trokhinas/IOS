//
//  ViewController.swift
//  Concentration
//
//  Created by Administrator on 07.09.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel!

    // MARK: - IBActions

    @IBAction private func newGameButton(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
        updateViewFromModel()
        flipCount = 0
        emojiChoices =
            ["👩‍👩‍👧‍👦", "👨‍👨‍👦", "👨‍👨‍👦‍👦", "👨‍❤️‍👨", "👩‍❤️‍👩", "👬", "👬", "👩‍❤️‍👩", "👨‍❤️‍👨", "👨‍👨‍👦‍👦", "👨‍👨‍👦", "👩‍👩‍👧‍👦"]
    }

    @IBAction private func touchCard(_ sender: UIButton)
    {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("choosen card is not in cardButton")
        }
    }

    // MARK: - Properties

    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    private var emojiChoices: Array<String> =
        ["👩‍👩‍👧‍👦", "👨‍👨‍👦", "👨‍👨‍👦‍👦", "👨‍❤️‍👨", "👩‍❤️‍👩", "👬", "👬", "👩‍❤️‍👩", "👨‍❤️‍👨", "👨‍👨‍👦‍👦", "👨‍👨‍👦", "👩‍👩‍👧‍👦"]
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    var emoji = [Card: String]()
    private (set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    private enum Constants {
        static let defaultColor = #colorLiteral(red: 0.9529411765, green: 0.7019607843, blue: 0.2588235294, alpha: 1)
        static let activeColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
    }
    
    // MARK: - Public methods
   
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji (for: card), for: UIControlState.normal)
                button.backgroundColor = Constants.activeColor
            } else {
                button.setTitle(
                    !card.isMatched ? "❔" : " ", for: UIControlState.normal)
                button.backgroundColor =
                    card.isMatched ? UIColor.clear : Constants.defaultColor
            }
        }
    }

    // MARK: - Private methods
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil,
            emojiChoices.count > 0 {
            
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.acr4random)
        }
        return emoji[card] ?? "?"
    }
    
}
