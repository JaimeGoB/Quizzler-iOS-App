//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by jaime on 12/24/20.
//  Copyright © 2020 JaimeGoB. All rights reserved.
//

import Foundation

struct Question {
    //variables
    let text: String
    let answer: String
    
    //constructor
    init(text: String, answer: String) {
        self.text = text
        self.answer = answer
    }
    
}
