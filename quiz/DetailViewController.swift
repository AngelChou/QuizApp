//
//  DetailViewController.swift
//  quiz
//
//  Created by Shun-Ching, Chou on 2017/5/1.
//  Copyright © 2017年 Shun-Ching, Chou. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!

    var categoryId:Int = 0
    var questions:[Questions] = []
    var answers:[Answers] = []
    var buttonArray:[UIButton] = []
    var question:Questions?
    var answerIds:[Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DetailViewController.nextQuiz))

        questions = CoreDataManager.getData(entityName: "Questions") as! [Questions]

        if questions.count == 0 {
            CoreDataManager.loadPresidentQuestions()
            questions = CoreDataManager.getData(entityName: "Questions") as! [Questions]
        }

        answers = CoreDataManager.getData(entityName: "Answers") as! [Answers]
        
        if answers.count == 0 {
            CoreDataManager.loadPresidentAnswers()
            answers = CoreDataManager.getData(entityName: "Answers") as! [Answers]
        }
        
        buttonArray = [button1, button2, button3, button4]
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        questions = CoreDataManager.getData(entityName: "Questions", predicate: NSPredicate(format:"categoryid=%@", "\(self.categoryId)")) as! [Questions]

        nextQuiz()
        assignButtonText(answers: answers)
    }

    @IBAction func GiveUpButtonClick(_ sender: Any) {
        for b in buttonArray {
            if b.tag == Int((question?.correctanswer)!) {
                b.setTitle("Correct!", for: UIControlState.normal)
            }
        }
    }

    @IBAction func button1Click(_ sender: Any) {
        isCorrectSelection(button: button1)
    }
    @IBAction func button2Click(_ sender: Any) {
        isCorrectSelection(button: button2)
    }
    @IBAction func button3Click(_ sender: Any) {
        isCorrectSelection(button: button3)
    }
    @IBAction func button4Click(_ sender: Any) {
        isCorrectSelection(button: button4)
    }

    func isCorrectSelection(button:UIButton) {
        button.setTitle("Incorrect!", for: UIControlState.normal)
        if button.tag == Int((question?.correctanswer)!) {
            button.setTitle("Correct!", for: UIControlState.normal)
        }
    }

    func nextQuiz() {
        let number = Int(arc4random_uniform(10))
        question = questions[number % questions.count]
        let answerResults = CoreDataManager.getData(entityName: "Answers", predicate:NSPredicate(format: "id in {\(question!.answerchoices!)}")) as! [Answers]

        createAnswerIds()
        questionLabel.text = question!.question
        assignButtonText(answers: answerResults)
    }

    func assignButtonText(answers: [Answers]) {
        let answerIdsShuffled = ShuffleArray(arrayparam: answerIds)

        let answer1 = answers.filter{Int($0.id) == answerIdsShuffled[0]}.first
        button1.setTitle(answer1?.answer, for: UIControlState.normal)
        button1.tag = Int(answer1!.id)

        let answer2 = answers.filter{Int($0.id) == answerIdsShuffled[1]}.first
        button2.setTitle(answer2?.answer, for: UIControlState.normal)
        button2.tag = Int(answer2!.id)

        let answer3 = answers.filter{Int($0.id) == answerIdsShuffled[2]}.first
        button3.setTitle(answer3?.answer, for: UIControlState.normal)
        button3.tag = Int(answer3!.id)

        let answer4 = answers.filter{Int($0.id) == answerIdsShuffled[3]}.first
        button4.setTitle(answer4?.answer, for: UIControlState.normal)
        button4.tag = Int(answer4!.id)

    }

    func createAnswerIds() {
        answerIds = []
        let arr = question?.answerchoices?.components(separatedBy: ",").flatMap{Int($0)}
        for i in arr! {
                answerIds.append(i)
        }
    }

    func ShuffleArray<T>(arrayparam: Array<T>) -> Array<T> {
        var array = arrayparam
        for index in ((0 + 1)...array.count - 1).reversed(){
            let j = Int(arc4random_uniform(UInt32(index-1)))
            swap(&array[index], &array[j])
        }
        return array
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
