//
//  Project+Convenience.swift
//  Task-CoreData
//
//  Created by Jenny Morales on 4/28/21.
//

import CoreData

extension Project {
    @discardableResult convenience init(name: String, date: Date?, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.date = date
    }
}//End of extension
