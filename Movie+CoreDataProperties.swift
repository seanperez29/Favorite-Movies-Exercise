//
//  Movie+CoreDataProperties.swift
//  Favorite Movies Exercise
//
//  Created by Sean Perez on 5/1/16.
//  Copyright © 2016 Sean Perez. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var title: String?
    @NSManaged var image: NSData?
    @NSManaged var desc: String?
    @NSManaged var link: String?

}
