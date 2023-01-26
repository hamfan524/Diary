//
//  DiaryEntity+CoreDataProperties.swift
//  Diary
//
//  Created by 최동호 on 2023/01/27.
//
//

import Foundation
import CoreData


extension DiaryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DiaryEntity> {
        return NSFetchRequest<DiaryEntity>(entityName: "DiaryEntity")
    }
    
    @NSManaged public var date: Date?
    @NSManaged public var title: String?
    @NSManaged public var content: String?

}

extension DiaryEntity : Identifiable {

}
