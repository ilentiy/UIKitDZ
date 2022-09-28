//
//  GuessNumber.swift
//  UIKitDZMain
//
//  Created by Илья on 24.09.2022.
//

import Foundation

/// Класс для игры угадай число
class GuessNumberGame {
    var secret: Int
    var answer: Int
    
    init() {
        secret = 0
        answer = 0
    }
    
    func generate() {
        secret = Int.random(in: 1...5)
    }
    
    func isRight(answer: Int) -> Bool {
        secret == answer
    }
}
