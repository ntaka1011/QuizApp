//
//  ViewController.swift
//  QuizzGameApp
//
//  Created by Nguyễn Viết Hùng on 2/6/23.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Variable
    var quiz = QuizApp.shared
    // MARK: UI OUtlet
    @IBOutlet weak var soccerLbl: UILabel!
    @IBOutlet weak var imageQuestion: UIImageView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var progressQuestion: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        soccerLbl.text = "Soccer: \(quiz.getSoccer()) PTS"
        
        imageQuestion.image = quiz.getImage()
        imageQuestion.layer.cornerRadius = 20
        imageQuestion.layer.masksToBounds = true
        
        questionLbl.text = quiz.getTextQuestion()
        questionLbl.textColor = quiz.getColor()
        
        
    }

    // MARK: UI Action
    @IBAction func userAnswer(_ sender: UIButton) {
        let answer = sender.titleLabel?.text
        print(sender.titleLabel?.text)
        
        let rightAnswer = quiz.checkAnswer(userAnswer: answer!)
        
        if rightAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.black
            // tạo hiệu ứng rung
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        }
        
        // khoá button lại
        trueBtn.isEnabled = false
        falseBtn.isEnabled = false
        
        if quiz.nextQuestion() {
            let alert = UIAlertController(title: "Đã hết câu hỏi", message: "Bạn muốn chơi lại không", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default) { _ in
                self.quiz.soccer = 0
                Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.changeQuestion), userInfo: nil, repeats: false)
            }
            let noAction = UIAlertAction(title: "No", style: .cancel) { _ in
                exit(0)
            }
            
            alert.addAction(yesAction)
            alert.addAction(noAction)
            
            present(alert, animated: true, completion: nil)
        } else {
            Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(changeQuestion), userInfo: nil, repeats: false)
        }
    
    }
    
    @objc func changeQuestion() {
        questionLbl.text = quiz.getTextQuestion()
        questionLbl.textColor = quiz.getColor()
        
        progressQuestion.progress = quiz.getProgress()
        
        imageQuestion.image = quiz.getImage()
        
        soccerLbl.text = "Soccer: \(quiz.getSoccer()) PTS"
        
        trueBtn.backgroundColor = UIColor.white
        falseBtn.backgroundColor = UIColor.white
        
        trueBtn.isEnabled = true
        falseBtn.isEnabled = true
        
        
    }
    
}

