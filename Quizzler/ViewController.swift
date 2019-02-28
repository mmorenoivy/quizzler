//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//
//this is responsible to show from model to the view(UI)
import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()//questionbank does not require parameters
    var pickedAnswer : Bool = false //hold the value user will pick
    var questionNumber : Int = 0
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getting all questions to be displayed in the app
        
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
        
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
        pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber = questionNumber + 1 //swift got rid of x++
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        
        progressBar.frame.size.width=(view.frame.size.width/13) * CGFloat (questionNumber + 1)
    }
    

    func nextQuestion() {
        if questionNumber <= 12{
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI()
        } else
        {
            let alert =  UIAlertController(title: "Awesome", message: "You've finished all the questions. Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {
                (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil) //present it to the viewer
            
           // print("End of Quiz")
           // questionNumber = 0
        }
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[0].answer
        
        if correctAnswer == pickedAnswer
        {
            //print("You got it")
            ProgressHUD.showSuccess("Correct")
            score = score + 1
            
        }else{
            ProgressHUD.showError("Incorrect")
        //    print("Wrong")
        }
    }
    
    
    func startOver() {
       questionNumber = 0 //reset the var
        score = 0
        nextQuestion() //instruct the app to go to the next question method
    }
    

    
}
