//
//  Question.swift
//  Quizzler
//
//  Created by Ivy, Marjorie on 2/20/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

//MVC pattern
//This is a model that prepares what can be easily seen in the screen
import Foundation

class Question
{
    //declare properties of an object
    let questionText : String
    let answer : Bool
    
    //Events - what should happen when the question object is initialized
    //give text and correct answer
    //this is what happens when a new object is declared
    init(text: String, correctAnswer: Bool){//questions are going to be on the fly
        questionText = text
        answer = correctAnswer
        
    }
}

