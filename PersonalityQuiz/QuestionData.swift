//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Armando Carrillo on 08/05/20.
//  Copyright © 2020 Armando Carrillo. All rights reserved.
//

import Foundation

enum ResponseType {
    case single, multiple, ranged
}

struct Question {
    var text = String.init()
    var type : ResponseType
    var answers : [Answer]
}
struct Answer {
    var text = String.init()
    var type : AnimalType
}

enum AnimalType : Character {
    case dog = "🐶" , cat = "🐱", rabbit = "🐭", turtle = "🐢"
    
    var definition : String{
        switch self {
        case .dog:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."

        }
    }
    
}
