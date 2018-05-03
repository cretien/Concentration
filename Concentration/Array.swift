//
//  Array.swift
//  Concentration
//
//  Created by C Buis on 01-05-18.
//  Copyright © 2018 C Buis. All rights reserved.
//

import Foundation

extension Array {
  
  /**
   * Get first item in array.
   *
   * @return First item in array.
   */
  
  func random () -> [Element]{
    var oldArray = self
    var newArray = [Element]()
    
    for _ in oldArray.indices {
      let randomIndex = Int(arc4random_uniform(UInt32(oldArray.count)))
      //print("randomIndex is: \(randomIndex)")
      let shuffledItem = oldArray.remove(at: randomIndex)
      //print("oldArray is: \(oldArray)")
      newArray.append(shuffledItem)
    }
    //print("newArray is: \(newArray)")
    return(newArray)
  }
  
  
  //  //: Playground - noun: a place where people can play
  //
  //  import UIKit
  //  import Foundation
  //
  //  var str = "Hello, playground"
  //
  //  var arr = [1,2,3,4,5,6,7,8,9]
  //  var arrnew = [Int]()
  //
  //  for _ in arr.indices {
  //  let randomIndex = Int(arc4random_uniform(UInt32(arr.count)))
  //  print("randomIndex is: \(randomIndex)")
  //  let shuffledItem = arr.remove(at: randomIndex)
  //  print("arr is: \(arr)")
  //  arrnew.append(shuffledItem)
  //  //arrnew.append(shuffledItem)
  //  }
  //  print("newarr is: \(arrnew)")
  //
  //  // kan ook met closure random sorting, maar ik weet nu even niet meer hoe dat precies gaat.
  //  arrnew.sort{$0 < $1}
  //  print("opnieuw gesorteerd is: \(arrnew)")
  //
  
  
}

