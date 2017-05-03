//
//  Questions+CoreDataProperties.swift
//  quiz
//
//  Created by Shun-Ching, Chou on 2017/5/2.
//  Copyright © 2017年 Shun-Ching, Chou. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Questions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Questions> {
        return NSFetchRequest<Questions>(entityName: "Questions");
    }

    @NSManaged public var id: Int16
    @NSManaged public var categoryid: Int16
    @NSManaged public var correctanswer: Int16
    @NSManaged public var answerchoices: String?
    @NSManaged public var questions: String?

}
