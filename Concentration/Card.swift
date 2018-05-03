//
//  Card.swift
//  Concentration
//
//  Created by C Buis on 01-05-18.
//  Copyright © 2018 C Buis. All rights reserved.
//

import Foundation

struct Card
{
  var isFacedUp = false
  var isMatched = false
  var identifier: Int

  //static function means that you cannot send it to this Card struct.
  //Card doesn't understand the method getUniqueIdentifier.
  //What understand this method is the TYPE Card.
  //See it as some kind of global function just tied to the type
  //You can't ask a card for a unique identifier.
  //You ask the Card-type instead.
  //Therefor you use "Card." in front of Card.getUniqueIdentifier()

  private static var identifierFactory = 0

  private static func getUniqueIdentifier() -> Int {
    //"Cards." is not necessary here because we are in static
    identifierFactory += 1  //Cards.identifierFactory += 1
    return identifierFactory
  }

  init() {
    self.identifier = Card.getUniqueIdentifier()
  }
}
