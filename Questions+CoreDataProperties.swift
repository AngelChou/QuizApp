//
//  Questions+CoreDataProperties.swift
//  quiz
//
//  Created by Shun-Ching, Chou on 2017/5/3.
//  Copyright © 2017年 Shun-Ching, Chou. All rights reserved.
//

import Foundation
import CoreData


extension Questions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Questions> {
        return NSFetchRequest<Questions>(entityName: "Questions");
    }

    @NSManaged public var answerchoices: String?
    @NSManaged public var categoryid: Int16
    @NSManaged public var correctanswer: Int16
    @NSManaged public var id: Int16
    @NSManaged public var question: String?

}
