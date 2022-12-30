//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButtonOutlet: UIButton!
    @IBOutlet weak var falseButtonOutlet: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    var timer = Timer()
    
    var quizBrain = QuizBrain()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton)
    {
        
        let userAnswer = sender.currentTitle!  //true or false
        quizBrain.checkAnswer(userAnswer)
        
        if userAnswer == realAnswer
        {
            sender.backgroundColor = UIColor.green
        }
        else
        {
            sender.backgroundColor = UIColor.red
        }
        
        if quizBrain.questionNumber + 1 != (quizBrain.quiz.count)
        {
            questionNumber += 1
        }
        else
        {
            questionNumber = 0
        }
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            self.updateUI()
            }
        
    }
    
    func updateUI()
    {
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
        questionLabel.text = quiz[questionNumber].text
        trueButtonOutlet.backgroundColor = UIColor.clear
        falseButtonOutlet.backgroundColor = UIColor.clear
    }
}

