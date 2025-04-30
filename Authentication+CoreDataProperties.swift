//
//  Authentication+CoreDataProperties.swift
//  IProtechs-UIKIT
//
//  Created by Nimish Mothghare on 29/04/25.
//
//

import Foundation
import CoreData


extension Authentication {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Authentication> {
        return NSFetchRequest<Authentication>(entityName: "Authentication")
    }


}

extension Authentication : Identifiable {

}
