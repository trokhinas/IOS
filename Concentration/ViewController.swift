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
    @IBOutlet private weak var flipCountLabel: UILabel!{
        didSet {
            updateFlipCountLabel()
        }
    }

    // MARK: - IBActions

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
        theme = ThemeGenerator.getNewTheme()
        emojiChoices = theme.getEmoji()
        defaultColor = theme.getBackCardColor()
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
        updateViewFromModel()
        flipCount = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties

    private var ThemeGenerator = ThemeStore()
    lazy private var theme = ThemeGenerator.getNewTheme()
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    lazy private var emojiChoices = theme.getEmoji() // строка с лицевыми символами
    private var emoji = [Card: String]()// эмодзи словарь
    lazy private var defaultColor = theme.getBackCardColor()
    lazy private var activeColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
    private var numberOfPairsOfCards: Int {//количество пар основанное на количестве карт
        return (cardButtons.count + 1) / 2
    }
    private (set) var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    
    // MARK: - Public methods
   
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji (for: card), for: UIControlState.normal)
                button.backgroundColor = activeColor
            } else {
                button.setTitle(
                    !card.isMatched ? "❔" : " ", for: UIControlState.normal)
                button.backgroundColor =
                    card.isMatched ? UIColor.clear : defaultColor
            }
        }
    }
    
    func updateFlipCountLabel() {
        let attribbutes : [NSAttributedStringKey: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: UIColor.red
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attribbutes)
        flipCountLabel.attributedText = attributedString
    }

    // MARK: - Private methods
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil,
            emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.acr4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
    
}
