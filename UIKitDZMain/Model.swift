//
//  Model.swift
//  UIKitDZMain
//
//  Created by Илья on 23.09.2022.
//

import Foundation

///  Проверяет вводимый текст
struct CheckText {
    func check(text: String) -> String {
        guard text == "leohl"  else { return "введите \"leohl\" " }
        return "Hello"
    }
}
