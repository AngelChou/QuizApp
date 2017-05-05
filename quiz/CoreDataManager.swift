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
        let managedObject = getManagedObject()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.returnsObjectsAsFaults = false

        if predicate != nil {
            request.predicate = predicate
            print(predicate!)
        }
            
        do{
            let results = try managedObject.fetch(request)
            resultsManagedObject = results as! [NSManagedObject]
        }
        catch{
            print("there are an error retrieving data")
        }
        return resultsManagedObject
    }

    static func deleteData(entityName:String){
        
        let managedObject = getManagedObject()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try managedObject.fetch(request)
            for result in results {
                managedObject.delete(result as! NSManagedObject)
            }
        }
        catch{
            print("there are an error deleting data")
        }
    }
    
    static func loadCategories(){

        let managedObject = getManagedObject()
        
        let entity1 = NSEntityDescription.entity(forEntityName: "Categories", in: managedObject)
        let category1 = NSManagedObject(entity: entity1!, insertInto: managedObject)
        category1.setValue("President", forKey: "categoriesname")
        category1.setValue("president", forKey: "imagename")
        category1.setValue(1, forKey: "id")
        
        
        let entity2 = NSEntityDescription.entity(forEntityName: "Categories", in: managedObject)
        let category2 = NSManagedObject(entity: entity2!, insertInto: managedObject)
        category2.setValue("Cities", forKey: "categoriesname")
        category2.setValue("cities", forKey: "imagename")
        category2.setValue(2, forKey: "id")
        
        
        let entity3 = NSEntityDescription.entity(forEntityName: "Categories", in: managedObject)
        let category3 = NSManagedObject(entity: entity3!, insertInto: managedObject)
        category3.setValue("Skyscapers", forKey: "categoriesname")
        category3.setValue("skyscapers", forKey: "imagename")
        category3.setValue(3, forKey: "id")
        
        
        let entity4 = NSEntityDescription.entity(forEntityName: "Categories", in: managedObject)
        let category4 = NSManagedObject(entity: entity4!, insertInto: managedObject)
        category4.setValue("Actors", forKey: "categoriesname")
        category4.setValue("actors", forKey: "imagename")
        category4.setValue(4, forKey: "id")
        
        do{
            try managedObject.save()
        }
        catch{
            print("error saving Categories")
        }
    }

    static func loadPresidentQuestions(){
        let managedObject = getManagedObject()

        let entity1 = NSEntityDescription.entity(forEntityName: "Questions", in: managedObject)
        let question1 = NSManagedObject(entity: entity1!, insertInto: managedObject)
        question1.setValue("Who was president from 1817 - 1825?", forKey: "question")
        question1.setValue(1, forKey: "correctanswer")
        question1.setValue(1, forKey: "id")
        question1.setValue(1, forKey: "categoryid")
        question1.setValue("1,2,3,4", forKey: "answerchoices")
        
        let entity2 = NSEntityDescription.entity(forEntityName: "Questions", in: managedObject)
        let question2 = NSManagedObject(entity: entity2!, insertInto: managedObject)
        question2.setValue("Who was president from 1877 - 1881?", forKey: "question")
        question2.setValue(2, forKey: "correctanswer")
        question2.setValue(2, forKey: "id")
        question2.setValue(1, forKey: "categoryid")
        question2.setValue("2,3,4,5", forKey: "answerchoices")
        
        
        let entity3 = NSEntityDescription.entity(forEntityName: "Questions", in: managedObject)
        let question3 = NSManagedObject(entity: entity3!, insertInto: managedObject)
        question3.setValue("Who was president from 1853 - 1857?", forKey: "question")
        question3.setValue(4, forKey: "correctanswer")
        question3.setValue(3, forKey: "id")
        question3.setValue(1, forKey: "categoryid")
        question3.setValue("1,3,4,5", forKey: "answerchoices")

        do{
            try managedObject.save()
        }
        catch{
            print("error saving Question of President")
        }
    }

    static func loadPresidentAnswers(){

        let managedObject = getManagedObject()

        let entity1 = NSEntityDescription.entity(forEntityName: "Answers", in: managedObject)
        let answer1 = NSManagedObject(entity: entity1!, insertInto: managedObject)
        answer1.setValue("James Monroe", forKey: "answer")
        answer1.setValue(1, forKey: "id")
        answer1.setValue(1, forKey: "categoryid")
        
        let entity2 = NSEntityDescription.entity(forEntityName: "Answers", in: managedObject)
        let answer2 = NSManagedObject(entity: entity2!, insertInto: managedObject)
        answer2.setValue("Rutherford B. Hayes", forKey: "answer")
        answer2.setValue(2, forKey: "id")
        answer2.setValue(1, forKey: "categoryid")
        
        let entity3 = NSEntityDescription.entity(forEntityName: "Answers", in: managedObject)
        let answer3 = NSManagedObject(entity: entity3!, insertInto: managedObject)
        answer3.setValue("Grover Cleveland", forKey: "answer")
        answer3.setValue(3, forKey: "id")
        answer3.setValue(1, forKey: "categoryid")
        
        let entity4 = NSEntityDescription.entity(forEntityName: "Answers", in: managedObject)
        let answer4 = NSManagedObject(entity: entity4!, insertInto: managedObject)
        answer4.setValue("James A. Garfield", forKey: "answer")
        answer4.setValue(4, forKey: "id")
        answer4.setValue(1, forKey: "categoryid")
        
        let entity5 = NSEntityDescription.entity(forEntityName: "Answers", in: managedObject)
        let answer5 = NSManagedObject(entity: entity5!, insertInto: managedObject)
        answer5.setValue("Franklin Pierce", forKey: "answer")
        answer5.setValue(5, forKey: "id")
        answer5.setValue(1, forKey: "categoryid")

        do{
            try managedObject.save()
        }
        catch{
            print("error saving Answers of President")
        }
    }

}
