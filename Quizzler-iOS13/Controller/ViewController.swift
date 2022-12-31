//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButtonOutlet: UIButton!
    @IBOutlet weak var falseButtonOutlet: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    var timer = Timer()
    
    var quizBrain = QuizBrain()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        progressBar.progress = 0.0
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton)
    {
        let userAnswer = sender.currentTitle!  //true or false
        let answerTrue = quizBrain.checkAnswer(userAnswer)
        
        if answerTrue
        {
            sender.backgroundColor = UIColor.green
            progressBar.progress = quizBrain.getProgress()
        }
        else
        {
            sender.backgroundColor = UIColor.red
            progressBar.progress = quizBrain.getProgress()
        }
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            self.updateUI() //this means to execute this code after 0.5 seconds
            }
        quizBrain.nextQuestion()
    }
    
    func updateUI()
    {
        scoreLabel.text = "Score \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        trueButtonOutlet.backgroundColor = UIColor.clear
        falseButtonOutlet.backgroundColor = UIColor.clear
    }
}

