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

//MARK: Question data
//Question struct containing Question, 4 answer options and the correct answer
struct Question {
    let question: String
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String?
    let correctAnswer: Int
}

//All the questions stored as an array of questions
let generalQuestions: [Question] = [Question(question: "This was the only US President to serve more than two consecutive terms.", answer1: "George Washington", answer2: "Franklin D. Roosevelt", answer3: "Woodrow Wilson", answer4: "Andrew Jackson", correctAnswer: 2),
                                    Question(question: "Which of the following countries has the most residents?", answer1: "Nigeria", answer2: "Russia", answer3: "Iran", answer4: "Vietnam", correctAnswer: 1),
                                    Question(question: "In what year was the United Nations founded?", answer1: "1918", answer2: "1919", answer3: "1945", answer4: "1954", correctAnswer: 3),
                                    Question(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", answer1: "Paris", answer2: "Washington D.C.", answer3: "New York City", answer4: "Boston", correctAnswer: 3),
                                    Question(question: "Which nation produces the most oil?", answer1: "Iran", answer2: "Iraq", answer3: "Brazil", answer4: "Canada", correctAnswer: 4),
                                    Question(question: "Which country has most recently won consecutive World Cups in Soccer?", answer1: "Italy", answer2: "Brazil", answer3: "Argetina", answer4: "Spain", correctAnswer: 2),
                                    Question(question: "Which of the following rivers is longest?", answer1: "Yangtze", answer2: "Mississippi", answer3: "Congo", answer4: "Mekong", correctAnswer: 2),
                                    Question(question: "Which city is the oldest?", answer1: "Mexico City", answer2: "Cape Town", answer3: "San Juan", answer4: "Sydney", correctAnswer: 1),
                                    Question(question: "Which country was the first to allow women to vote in national elections?", answer1: "Poland", answer2: "United States", answer3: "Sweden", answer4: "Senegal", correctAnswer: 1),
                                    Question(question: "Which of these countries won the most medals in the 2012 Summer Games?", answer1: "France", answer2: "Germany", answer3: "Japan", answer4: "Great Britian", correctAnswer: 4)
                                    ]

let sportsQuestions: [Question] = [Question(question: "Which sport is played on the largest pitch?", answer1: "Polo", answer2: "Soccer", answer3: "Rugby", answer4: "Ice Hockey", correctAnswer: 1),
                                   Question(question: "In 1950, India withdrew from the World Cup because FIFA refused to let them do what?", answer1: "Win", answer2: "Withdraw", answer3: "Play barefoot", answer4: nil, correctAnswer: 3),
                                   Question(question: "What is the connection between Volleyball, Squash and Badminton? Clue: This connection is not shared with tennis or table tennis.", answer1: "Only the server can score", answer2: "You change positions throughout the game", answer3: "You don't have a coach", answer4: "You use a ball", correctAnswer: 1),
                                   Question(question: "In darts, what is the lowest score that CANNOT be scored with a single dart?", answer1: "23", answer2: "2", answer3: "22", answer4: "25", correctAnswer: 1),
                                   Question(question: "Which sports playing area is 2.7 metres by 1.5 metres?", answer1: "Squash", answer2: "Table Tennis", answer3: "Batminton", answer4: "Darts", correctAnswer: 2),
                                   Question(question: "Which sport do the Oklahoma City Thunder play?", answer1: "Basketball", answer2: "Rugby", answer3: "American Football", answer4: "Ice Hockey", correctAnswer: 1),
                                   Question(question: "In Athletics, what is the last event of the Decathlon?", answer1: "Javelin throw", answer2: "High jump", answer3: "1500m", answer4: "Hurdles", correctAnswer: 3),
                                   Question(question: "What is the only sport to have been played on the surface of the moon?", answer1: "Batminton", answer2: "Basketball", answer3: "Hockey", answer4: "Golf", correctAnswer: 4),
                                   Question(question: "Who was the first cricketer to achieve 10,000 runs in test cricket?", answer1: "Alan Border", answer2: "Sunil Gavasker", answer3: "Brian Lara", answer4: "Jacques Kallis", correctAnswer: 2),
                                   Question(question: "What is the highest possible break in snooker?", answer1: "147", answer2: "150", answer3: "155", answer4: nil, correctAnswer: 3),
                                   Question(question: "Who were the runners up in the Europa League Final of 2010?", answer1: "Atlético Madrid", answer2: "Hamburg FC", answer3: "Fulham FC", answer4: "Liverpool", correctAnswer: 3),
                                   Question(question: "James Naismith invented which sport?", answer1: "Basketball", answer2: "Rugby", answer3: "Hockey", answer4: nil, correctAnswer: 1),
                                   Question(question: "Who scored the winning goal for Romania when they beat England in the 1998 World Cup?", answer1: "Constantin Gâlcă", answer2: "Adrian Ilie", answer3: "Viorel Moldovan", answer4: "Dan Petrescu", correctAnswer: 4),
                                   Question(question: "What significant sporting event took place on November 22nd 2003?", answer1: "The (2003) Footbal World Cup Final", answer2: "The (2003) Hockey World Cup Final", answer3: "The (2003) Rugby World Cup Final", answer4: nil, correctAnswer: 3)
                                   
                                    ]
//Get a question from the array for the selected category, check if it's not used already
func getQuestion(type: String, used: [Int]) -> Question {
    var arrayToUse: [Question]
    switch type {
    case "Sports":
        arrayToUse = sportsQuestions
    case "General":
        arrayToUse = generalQuestions
    default:
        arrayToUse = generalQuestions
    }
    let randomNumber = randomNumberGenerator(used, max: arrayToUse.count)
    usedQuestions.append(randomNumber)
    return arrayToUse[randomNumber]
}

var usedQuestions: [Int] = []

//Random number generator
func numberGenerator(max: Int) -> Int {
    let randomNumber = GKRandomSource.sharedRandom().nextIntWithUpperBound(max)
    return randomNumber
}
//The number created above may have been used already, here that is checked, if the number is used we generate a new one, otherwise we return it
func randomNumberGenerator(usedNumbers: [Int], max: Int) -> Int {
    //Get a number from the numberGenerator
    var randomNumber = numberGenerator(max)
    //Check if it's in the usedNumbers array
    while usedNumbers.contains(randomNumber) {
        //The number is already used, create a new one and check again
        randomNumber = numberGenerator(max)
    }
    //Return a number that is not used before
    return randomNumber
}

//MARK: Sound data

var gameSound: SystemSoundID = 0
//Function to play a game sound
func playSound(path: String) {
    let soundURL = NSURL(fileURLWithPath: path)
    AudioServicesCreateSystemSoundID(soundURL, &gameSound)
    AudioServicesPlaySystemSound(gameSound)
}