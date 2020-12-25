//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Variables to for progress bar
    var questionNumber = 0
    var correctQuestions = 0
    var totalNumberOfQuestions = 1

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    /*
     * Initializing an arraw of structs that will
     * hold the questions and answers
     */
    let quiz = [
        Question(text: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        Question(text: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Question(text: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Question(text: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Question(text: "Google was originally called 'Backrub'.", answer: "True"),
        Question(text: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Question(text: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Question(text: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
            ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Starting Progress Bar to 0%
        totalNumberOfQuestions = quiz.count
        updateUI()
        progressBar.progress = Float(correctQuestions) / Float(totalNumberOfQuestions)
    }

    /*
     * This action is triggered by touching either
     * True or False button.
     */
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        /*
            * Store the button the user choosed.
            */
        let userAnswer = sender.currentTitle
        
        //Storing the answer for current question
        let actualAnswer = quiz[questionNumber].answer
        
        /*
         * Checking if the user answer correctly
         * if correct we will update correct question
         * and update progress bar.
         */
        if(userAnswer == actualAnswer){
            correctQuestions += 1
            progressBar.progress = Float(correctQuestions) / Float(totalNumberOfQuestions)
        }
        
        //Move to next Question
        if(questionNumber != quiz.count-1){
            //Update question value
            questionNumber += 1
            updateUI()

        }else{ //RESET QUIZ - restart counters and progress view
            
            //Use to output users score
            let finalScorePercent = (Float(self.correctQuestions) / Float(self.totalNumberOfQuestions)) * 100.0
            
            let finalScoreStr = String(format: "%.2f", finalScorePercent)
            
            questionNumber = 0
            correctQuestions = 0
            questionLabel.text = "Final Score: " + finalScoreStr + "%"
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.progressBar.progress = Float(self.correctQuestions) / Float(self.totalNumberOfQuestions)
                self.updateUI()
            }
        }
    }
    
    //This function will change the question.
    func updateUI(){
        questionLabel.text = quiz[questionNumber].text
    }
}

