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
    func setMonth() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        if let dateToBeModified = date{
            let month = dateFormatter.string(from: dateToBeModified)
            return month.uppercased()
        }
        return ""
    }
    func setDay() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        if let dateToBeModified = date{
            let day = dateFormatter.string(from: dateToBeModified)
            return day
        }
        return ""
    }
}
