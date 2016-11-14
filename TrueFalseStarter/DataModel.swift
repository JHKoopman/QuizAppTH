//
//  DataModel.swift
//  TrueFalseStarter
//
//  Created by Jari Koopman on 07/11/2016.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import UIKit
import GameKit
import AudioToolbox

struct Question {
    let question: String
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String?
    let correctAnswer: Int
}

let questions: [Question] = [Question(question: "", answer1: "", answer2: "", answer3: "", answer4: nil, correctAnswer: 2)]

//struct MathQuestion {
//    let a: Double = Double(GKRandomSource.sharedRandom().nextIntWithUpperBound(10))
//    let b: Double = Double(GKRandomSource.sharedRandom().nextIntWithUpperBound(10))
//    let type: Int = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
//    let types = ["+","-","/","*"]
//}
//
//func createMathQuestion(data: MathQuestion) -> [String:String] {
//    let question = "\(data.a) \(data.types[data.type]) \(data.b)"
//    var answer: Double {
//        switch data.types[data.type] {
//        case "+":
//            return data.a + data.b
//        case "-":
//            return data.a - data.b
//        case "/":
//            return data.a / data.b
//        case "*":
//            return data.a * data.b
//        default:
//            return data.a + data.b
//        }
//    }
//    
//    let questionData: [String:String] = ["Question":question, "Answer":String(answer)]
//    return questionData
//}
//
//let test = MathQuestion()
//let testQuestion = createMathQuestion(test)