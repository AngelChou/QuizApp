//
//  CoreDataManager.swift
//  quiz
//
//  Created by Shun-Ching, Chou on 2017/5/1.
//  Copyright © 2017年 Shun-Ching, Chou. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    static func getManagedObject() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    static func getData(entityName:String, predicate:NSPredicate?=nil) -> [NSManagedObject]{
        var resultsManagedObject:[NSManagedObject] = []

        do{
            let managedObject = getManagedObject()
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            if predicate != nil {
                request.predicate = predicate
            }
            let results = try managedObject.fetch(request)
            resultsManagedObject = results as! [NSManagedObject]
        }
        catch{
            print("there are an error retrieving data")
        }
        return resultsManagedObject
    }

    static func loadCategories(){

        let managedObject = getManagedObject()

        let category1 = NSEntityDescription.insertNewObject(forEntityName: "Categories", into: managedObject) as! Categories
        category1.categoriesname = "President"
        category1.imagename = "president"
        category1.id = 1

        let category2 = NSEntityDescription.insertNewObject(forEntityName: "Categories", into: managedObject) as! Categories
        category2.categoriesname = "Cities"
        category2.imagename = "cities"
        category2.id = 2

        let category3 = NSEntityDescription.insertNewObject(forEntityName: "Categories", into: managedObject) as! Categories
        category3.categoriesname = "Skyscapers"
        category3.imagename = "skyscapers"
        category3.id = 3

        let category4 = NSEntityDescription.insertNewObject(forEntityName: "Categories", into: managedObject) as! Categories
        category4.categoriesname = "Actors"
        category4.imagename = "actors"
        category4.id = 4

        do{
            try managedObject.save()
        }
        catch{
            print("error saving Categories")
        }
    }

    static func loadPresidentQuestions(){
        let managedObject = getManagedObject()

        //James Monroe
        let question1 = NSEntityDescription.insertNewObject(forEntityName: "Questions", into: managedObject) as! Questions
        question1.question = "Who was president from 1817 - 1825?"
        question1.correctanswer = 1
        question1.id = 1
        question1.categoryid = 1
        question1.answerchoices = "1,2,3,4"

        //Rutherford B. Hayes
        let question2 = NSEntityDescription.insertNewObject(forEntityName: "Questions", into: managedObject) as! Questions
        question2.question = "Who was president from 1877 - 1881?"
        question2.correctanswer = 2
        question2.id = 2
        question2.categoryid = 1
        question2.answerchoices = "2,3,4,5"

        //Franklin Pierce
        let question3 = NSEntityDescription.insertNewObject(forEntityName: "Questions", into: managedObject) as! Questions
        question3.question = "Who was president from 1853 - 1857?"
        question3.correctanswer = 5
        question3.id = 3
        question3.categoryid = 1
        question3.answerchoices = "1,3,4,5"

        do{
            try managedObject.save()
        }
        catch{
            print("error saving Question of President")
        }
    }

    static func loadPresidentAnswers(){

        let managedObject = getManagedObject()

        let answer11 = NSEntityDescription.insertNewObject(forEntityName: "Answers", into: managedObject) as! Answers
        answer11.answer = "James Monroe"
        answer11.id = 1
        answer11.categoryid = 1
        // answer11.questionid = 1

        let answer12 = NSEntityDescription.insertNewObject(forEntityName: "Answers", into: managedObject) as! Answers
        answer12.answer = "Rutherford B. Hayes"
        answer12.id = 2
        answer12.categoryid = 1
        // answer12.questionid = 2

        let answer13 = NSEntityDescription.insertNewObject(forEntityName: "Answers", into: managedObject) as! Answers
        answer13.answer = "Grover Cleveland"
        answer13.id = 3
        answer13.categoryid = 1
        // answer13.questionid = 0

        let answer14 = NSEntityDescription.insertNewObject(forEntityName: "Answers", into: managedObject) as! Answers
        answer14.answer = "James A. Garfield"
        answer14.id = 4
        answer14.categoryid = 1
        // answer13.questionid = 0

        let answer15 = NSEntityDescription.insertNewObject(forEntityName: "Answers", into: managedObject) as! Answers
        answer15.answer = "Franklin Pierce"
        answer15.id = 5
        answer15.categoryid = 1
        // answer15.questionid = 3

        do{
            try managedObject.save()
        }
        catch{
            print("error saving Answers of President")
        }
    }

}
