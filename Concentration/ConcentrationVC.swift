//
//  ConcentrationVC.swift
//  Concentration
//
//  Created by C Buis on 03-05-18.
//  Copyright © 2018 C Buis. All rights reserved.
//

import UIKit

class ConcentrationVC: UIViewController {

  private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
  
  var numberOfPairsOfCards: Int {
    //this is a get only a can therefor be left out
    return (cardButtons.count + 1) / 2
  }
  
  private(set) var flipCount = 0 {
    didSet {
      flipCountLabel.text = "Flips: \(flipCount)"
    }
  }
  
  private(set) var recordCount = 0 {
    didSet {
      recordCountLabel.text = "Record: \(recordCount)"
    }
  }
  
  private let emojiLibrary = ["👻","🎃","👿","👹","🦇","🕷","🧙‍♂️","🤪","🙈","🦉"]
  private var emojiChoices = [String]()
  private var emoji = [Int:String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startGame()
  }
  
  @IBOutlet private weak var flipCountLabel: UILabel!
  @IBOutlet private weak var recordCountLabel: UILabel!
  
  @IBOutlet private var cardButtons: [UIButton]!
  
  @IBAction private func touchCard(_ sender: UIButton) {
    flipCount += 1
    if let cardNumber = cardButtons.index(of: sender) {
      game.chooseCard(at: cardNumber)
      updateViewFromModel()
      //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
      print("cardNumber is: \(cardNumber)")
    } else {
      print("Chosen card was not in cardButtons.")
    }
    //flipCard(withEmoji: (sender.titleLabel?.text)!, on: sender)
  }
  
  @IBAction private func startGame() {
    if gameCompleted() {
      if recordCount == 0 {
        recordCount = flipCount
      } else if flipCount < recordCount {
        recordCount = flipCount
      }
    }
    
    game = Concentration(numberOfPairsOfCards: ((cardButtons.count + 1) / 2))
    var numberOfPairsOfCards: Int {
      get{
        return (cardButtons.count + 1) / 2
      }
    }
    
    emojiChoices = emojiLibrary
    updateViewFromModel()
    flipCount = 0
  }
  
  
  private func gameCompleted() -> Bool {
    for card in game.cards {
      if card.isMatched == false {
        return false
      }
    }
    return true
  }
  
  private func updateViewFromModel() {
    print("\(#function): starting.")
    
    for index in cardButtons.indices {
      let button = cardButtons[index]
      let card = game.cards[index]
      if card.isFacedUp {
        button.setTitle(emoji(for: card), for: .normal)
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      } else {
        button.setTitle("", for: .normal)
        button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
      }
    }
  }
  
  //  func flipCard (withEmoji emoji: String, on button: UIButton) {
  //    if button.currentTitle == emoji {
  //      button.setTitle("", for: .normal)
  //      button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
  //    } else {
  //      button.setTitle(emoji, for: .normal)
  //      button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
  //    }
  //  }
  //
  //
  
  private func emoji(for card: Card) -> String {
    if emoji[card.identifier] == nil, emojiChoices.count > 0 {
      emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
    }
    return emoji[card.identifier] ?? "?"
    // this is the same:
    //    if let chosenEmoji = emoji[card.identifier] {
    //      return chosenEmoji
    //    } else {
    //      return "?"
    //    }
  }
  
  
}

