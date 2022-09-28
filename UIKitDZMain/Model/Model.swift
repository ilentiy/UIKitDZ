//
//  Model.swift
//  UIKitDZMain
//
//  Created by Илья on 24.09.2022.
//

import Foundation

///   информация для добавления нового пользователя
struct UserData {
    var gender = ["Парень", "Девушка"]
    var ages: [Int] = {
        var ages: [Int] = []
        for age in 1...100 {
            ages.append(age)
        }
        return ages
    }()
}
