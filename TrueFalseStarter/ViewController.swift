//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    var questionsPerRound: Int = 0
    var questionsAsked = 0
    var correctQuestions = 0
    var question: Question = Question(question: "OOPS", answer1: "OOPS", answer2: "OOPS", answer3: "OOPS", answer4: "OOPS", correctAnswer: 1)
    
    var categoryData: String!
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    @IBOutlet weak var indicatorLabel: UILabel!
    @IBOutlet weak var option4CenterConstraint: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        usedQuestions = []
        questionsPerRound = questionsCount(categoryData)
        self.title = "Do you know \(categoryData)?"
        self.navigationItem.setHidesBackButton(true, animated:false)
        playSound(NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")!)
        // Start game
        displayQuestion()
    }

    func displayQuestion() {
        switch categoryData {
        case "Sports", "General":
            question = getQuestion(categoryData, used: usedQuestions)
            if question.answer4 == nil {
                option4CenterConstraint.constant = 400
            } else {
                option4CenterConstraint.constant = 0
                option4Button.setTitle(question.answer4, forState: .Normal)
            }
        default:
            print("Something went wrong! Oops!")
        }
        indicatorLabel.hidden = true
        option1Button.alpha = 1
        option2Button.alpha = 1
        option3Button.alpha = 1
        option4Button.alpha = 1
        questionField.text = question.question
        option1Button.setTitle(question.answer1, forState: .Normal)
        option2Button.setTitle(question.answer2, forState: .Normal)
        option3Button.setTitle(question.answer3, forState: .Normal)
        questionField.adjustsFontSizeToFitWidth = true
        option1Button.titleLabel?.adjustsFontSizeToFitWidth = true
        option2Button.titleLabel?.adjustsFontSizeToFitWidth = true
        option3Button.titleLabel?.adjustsFontSizeToFitWidth = true
        option4Button.titleLabel?.adjustsFontSizeToFitWidth = true
        playAgainButton.hidden = true
    }
    
    func displayScore() {
        // Hide the answer buttons
        option1Button.hidden = true
        option2Button.hidden = true
        option3Button.hidden = true
        option4Button.hidden = true
        
        // Display play again button
        playAgainButton.setTitle("Play again!", forState: .Normal)
        playAgainButton.hidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        let correctAnswer = question.correctAnswer
        if (sender === option1Button &&  correctAnswer == 1) || (sender === option2Button && correctAnswer == 2) || (sender === option3Button && correctAnswer == 3) || (sender === option4Button && correctAnswer == 4) {
            correctQuestions += 1
            indicatorLabel.text = "Correct!"
            indicatorLabel.hidden = false
            indicatorLabel.textColor = UIColor.greenColor()
            option1Button.alpha = 0.5
            option2Button.alpha = 0.5
            option3Button.alpha = 0.5
            if question.answer4 != nil {
                option4Button.alpha = 0.5
            }
            sender.alpha = 1.0
            playSound(NSBundle.mainBundle().pathForResource("Correct", ofType: "wav")!)
        } else {
            var correctString = ""
            switch correctAnswer {
            case 1:
                correctString = question.answer1
            case 2:
                correctString = question.answer2
            case 3:
                correctString = question.answer3
            case 4:
                if question.answer4 != nil {
                    correctString = question.answer4!
                } else {
                    correctString = ""
                }
            default:
                print("Something went wrong! Oops!")
            }
            indicatorLabel.text = "Sorry, wrong answer! The correct answer is: \(correctString)"
            indicatorLabel.hidden = false
            indicatorLabel.textColor = UIColor.redColor()
            option1Button.alpha = 0.5
            option2Button.alpha = 0.5
            option3Button.alpha = 0.5
            if question.answer4 != nil {
                option4Button.alpha = 0.5
            }
            sender.alpha = 1.0
            playSound(NSBundle.mainBundle().pathForResource("False", ofType: "wav")!)
        }
        if questionsAsked == questionsPerRound {
            self.nextRound()
        } else {
            playAgainButton.setTitle("Next question", forState: UIControlState.Normal)
            playAgainButton.hidden = false
        }
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        if playAgainButton.titleLabel?.text == "Next question" {
            self.nextRound()
        } else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    func questionsCount(type: String) -> Int {
        var arrayToUse: [Question]!
        switch type {
        case "Sports":
            arrayToUse = sportsQuestions
        case "General":
            arrayToUse = generalQuestions
        default:
            arrayToUse = generalQuestions
        }
        return arrayToUse.count
    }
}

