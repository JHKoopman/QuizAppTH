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
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    
    var categoryData: [String:AnyObject]!
    
    let trivia: [[String : String]] = [
        ["Question": "Only female koalas can whistle", "Answer": "False"],
        ["Question": "Blue whales are technically whales", "Answer": "True"],
        ["Question": "Camels are cannibalistic", "Answer": "False"],
        ["Question": "All ducks are birds", "Answer": "True"]
    ]
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Do you know \(categoryData["Category"] as! String)?"
        self.navigationItem.setHidesBackButton(true, animated:false)
        playSound(NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")!)
        // Start game
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextIntWithUpperBound(trivia.count)
        let questionDictionary = trivia[indexOfSelectedQuestion]
        questionField.text = questionDictionary["Question"]
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
        
        let selectedQuestionDict = trivia[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict["Answer"]
        
        if (sender === option1Button &&  correctAnswer == "True") || (sender === option2Button && correctAnswer == "False") {
            correctQuestions += 1
            questionField.text = "Correct!"
            playSound(NSBundle.mainBundle().pathForResource("Correct", ofType: "wav")!)
        } else {
            questionField.text = "Sorry, wrong answer!"
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
}

