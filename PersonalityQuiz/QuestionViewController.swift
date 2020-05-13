//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Armando Carrillo on 08/05/20.
//  Copyright © 2020 Armando Carrillo. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet weak var multiLabel: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
       
    }
    var answerChosen : [Answer] = []
    var questionIndex = Int.init()
    var question: [Question] = [
        Question(text: "Wich activities do you enjoy ?", type: .multiple, answers: [
            Answer(text: "Swiming", type: .turtle),
            Answer(text: "Sleeping", type: .cat),
            Answer(text: "Cudding", type: .rabbit),
            Answer(text: "Eating", type: .dog)
        ])
    
    ]
    func updateUI(){
        multipleStackView.isHidden = true
        let currentQuestion = question[questionIndex]
        let currentAnswer = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(question.count)
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .multiple:
           // multipleStackView.isHidden = false
            updateMultipleStack(using: currentAnswer)
        case .single:
            multipleStackView.isHidden = false
        
        case .ranged:
            multipleStackView.isHidden = false
        }
    }
    func updateMultipleStack(using answers : [Answer]){
        multipleStackView.isHidden = false
        multiLabel.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
        
    }
    
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = question[questionIndex].answers
        if multiSwitch1.isOn{
            answerChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn{
            answerChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn{
            answerChosen.append(currentAnswers[2])
        }
        if multiSwitch3.isOn{
            answerChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    func nextQuestion (){
        questionIndex += 1
        if questionIndex < question.count{
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
}
