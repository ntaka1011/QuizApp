//
//  QuizApp.swift
//  QuizzGameApp
//
//  Created by Nguyễn Viết Hùng on 2/6/23.
//

import Foundation
import UIKit
struct QuizApp {
    // singleton
    static let shared = QuizApp()
    private init() { }
    
    let question = [
        Question(text: "Buenos Aires có phải là thủ đô của nước Argentina.", answer: "True", color: UIColor.black, image: UIImage(named: "ques1")!),
        Question(text: "Ronaldo có phải cầu thủ hay nhất thế giới.", answer: "True", color: UIColor.black, image: UIImage(named: "ques2")!),
        Question(text: "Cá Mập là con vật nhiều răng nhất.", answer: "False", color: UIColor.black, image: UIImage(named: "ques3")!)
    ]
    
    var numQuestion = 0
    var soccer = 0
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if question[numQuestion].answer == userAnswer {
            soccer += 1
            return true
        } else {
            return false
        }
    }
    
    func getSoccer() -> Int {
        return soccer
    }
    
    func getTextQuestion() -> String{
        let questionQuiz = question[numQuestion].text
        return questionQuiz
    }
    
    func getProgress() -> Float {
        let progress = Float(numQuestion + 1) / Float(question.count)
        return progress
    }
    
    func getColor() -> UIColor {
        return question[numQuestion].color
    }
    
    func getImage() -> UIImage {
        return question[numQuestion].image
    }
    
    mutating func nextQuestion() -> Bool {
        if numQuestion + 1 < question.count {
            numQuestion += 1
            return false
        } else {
            numQuestion = 0
            return true
        }
    }
}
