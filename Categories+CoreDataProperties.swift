//
//  Categories+CoreDataProperties.swift
//  quiz
//
//  Created by Shun-Ching, Chou on 2017/5/2.
//  Copyright © 2017年 Shun-Ching, Chou. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Categories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories");
    }

    @NSManaged public var categoriesname: String?
    @NSManaged public var id: Int16
    @NSManaged public var imagename: String?

}
