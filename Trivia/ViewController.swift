//
//  ViewController.swift
//  Trivia
//
//  Created by Enrique Camou Villa on 07/10/25.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // print("testing")
        loadQuestion()
    }
    let questionList = [
        ("How many hours are in a day?", ["12","20","30","24"]),
        ("What is the smallest planet in our solar system?", ["Mars","Venus","Earth","Mercury"]),
        ("How many states are in the USA?", ["48","49","51","50"]),
        ("What is the tallest mountain in the world?", ["K2","Kilimanjaro","Denali","Mount Everest"]),
        ("What gas do plants absorb from the atmosphere?", ["Oxygen","Nitrogen","Helium","Carbon Dioxide"]),
        ("How many teeth does an adult human have?", ["28","30","34","32"]),
        ("What is the largest mammal in the world?", ["Elephant","Shark","Giraffe","Blue Whale"]),
        ("What is the capital of Japan?", ["Osaka","Kyoto","Yokohama","Tokyo"]),
        ("How many strings does a standard guitar have?", ["4","5","7","6"]),
        ("What is the boiling point of water in Celsius?", ["50","90","110","100"]),
        ("How many colors are in a rainbow?", ["5","6","8","7"]),
        ("What is the largest organ in the human body?", ["Liver","Heart","Brain","Skin"]),
        ("How many sides does a hexagon have?", ["5","7","8","6"]),
        ]
    
    var previousIndex = -1
    var currentIndex = -1
    var answeredQuestions: [Int] = []
    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var answerOne: UIButton!
    
    @IBOutlet weak var answerTwo: UIButton!
    
    @IBOutlet weak var answerThree: UIButton!
    
    @IBOutlet weak var answerFour: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    func getNewRandomIndex() -> Int {
        if answeredQuestions.count == questionList.count {
            answeredQuestions.removeAll()
        }
        
        repeat {
            currentIndex = Int.random(in: 0..<questionList.count)
        } while answeredQuestions.contains(currentIndex)
        
        answeredQuestions.append(currentIndex)
        return currentIndex
    }
    
    func loadQuestion(){
        self.view.backgroundColor = .white
        let (questionText, answers) = questionList[getNewRandomIndex()]
        answeredQuestions.append(getNewRandomIndex())
        
        question.text = questionText
        answerOne.setTitle(answers[0], for: .normal)
        answerTwo.setTitle(answers[1], for: .normal)
        answerThree.setTitle(answers[2], for: .normal)
        answerFour.setTitle(answers[3], for: .normal)
        
    }
    
    @IBAction func answerOneTapped(_ sender: Any) {
        runAnswer(selectedQuestion: 0)
    }
    @IBAction func answerTwoTapped(_ sender: Any) {
        runAnswer(selectedQuestion: 1)
    }
    @IBAction func answerThreeTapped(_ sender: Any) {
        runAnswer(selectedQuestion: 2)
    }
    @IBAction func answerFourTapped(_ sender: Any) {
        runAnswer(selectedQuestion: 3)
    }
    func runAnswer(selectedQuestion: Int){
        if selectedQuestion == 3 {
            self.view.backgroundColor = .green
        } else {
            self.view.backgroundColor = .red
        }
    
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.loadQuestion()
        }
        
    }
    
}
