//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by jaime on 12/26/20.
//  Copyright © 2020 JaimeGoB. All rights reserved.
//

import Foundation


struct QuizBrain {
    
    var currentQuestion:Int
    let numberOfQuizQuestions:Int

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
    
    init() {
        numberOfQuizQuestions = quiz.count
        currentQuestion = 0
    }
    
    func checkAnswer(_ userAnswer: String) -> Bool{
        
        if(userAnswer == quiz[currentQuestion].answer){
            //user got question right
            return true
        }else{
            //user got question wrong
            return false
        }
    }
    
    //Checkin we are not going out of bounds in quiz array
    func checkBounds() -> Bool {
        return (quiz.count - 1 != currentQuestion)
    }
    
    mutating func moveToNextQuestion(){
        //Move on to next question.
        currentQuestion += 1
    }
    
    mutating func resetQuestionNumber(){
        currentQuestion = 0
    }
    
    func getQuestion() -> String {
        return quiz[currentQuestion].text
    }
    
    func getTotalNumberOfQuestions() -> Int {
        return numberOfQuizQuestions
    }
    
    func getQuestionNumber() -> Int {
        return currentQuestion
    }
    
    func getUserScore(_ numberOfCorrectQuestions:Int) -> Float {
        return Float(numberOfCorrectQuestions) / Float(numberOfQuizQuestions)
    }
}
