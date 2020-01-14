//
//  Stack.swift
//  Algonos
//
//  Created by Tristan Bilot on 14/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

struct Stack<Element> {
  fileprivate var array: [Element] = []
  
  mutating func push(_ element: Element) {
    array.append(element)
  }
  
  mutating func pop() -> Element? {
    return array.popLast()
  }
  
  func peek() -> Element {
    return array.last!
  }
  
  var isEmpty: Bool {
    return array.isEmpty
  }

  var count: Int {
    return array.count
  }
}
