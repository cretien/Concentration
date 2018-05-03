//
//  Concentration.swift
//  Concentration
//
//  Created by C Buis on 01-05-18.
//  Copyright © 2018 C Buis. All rights reserved.
//

import Foundation

class Concentration {
  
  //var cards: Array<Card>
  //var cards = Array<Card>()
  private(set) var cards = [Card]()
  private var indexOfOneAndOnlyFaceUpCard: Int? {
    get {
      var indexFound: Int?
      for index in cards.indices {
        if cards[index].isFacedUp {
          if indexFound == nil {
            indexFound = index
          } else {
            return nil
          }
        }
      }
      return indexFound
    }
    set {
      for index in cards.indices {
        cards[index].isFacedUp = (index == newValue) // (true or false)
        // is exactly the same as:
        //        if index == newValue {
        //          cards[index].isFacedUp = true
        //        }
        //        else {
        //          cards[index].isFacedUp = false
        //        }
      }
    }
  }
  
  func chooseCard(at index: Int) {
    assert(cards.indices.contains(index),"\(#file) \(#function) \(index): Chosen index is not in the cards.")
    print("\(#function): index is: \(index)")
    if !cards[index].isMatched {
      if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
        //check if turned cards match
        if cards[index].identifier == cards[matchIndex].identifier {
          //we found a match
          cards[index].isMatched = true
          cards[matchIndex].isMatched = true
        }
        cards[index].isFacedUp = true
      } else {
        indexOfOneAndOnlyFaceUpCard = index
      }
      
    }
  }
    
    init(numberOfPairsOfCards: Int) {
      assert(numberOfPairsOfCards>0,"\(#file) \(#function) \(numberOfPairsOfCards): You must have at least one pair of cards.")
      print("\(#function): making new cards.")
      for _ in 1...numberOfPairsOfCards {
        let card = Card() //Card has to figure out it's own identifier
        cards += [card, card] //same: cards.append(card, card) //(add 2 cards)
      }
      //TODO: - Shuffle the cards
      cards = cards.random()
    }
}
