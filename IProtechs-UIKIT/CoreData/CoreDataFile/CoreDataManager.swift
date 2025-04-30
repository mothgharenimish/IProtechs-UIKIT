//
//  CoreDataManager.swift
//  IProtechs-UIKIT
//
//  Created by Nimish Mothghare on 29/04/25.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    // MARK: - Core Data context
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var context: NSManagedObjectContext!
    
    init() {
        context = appDelegate.persistentContainer.viewContext
    }
    
    // MARK: - Save User Data
    func saveUserData(username: String, password: String, confirmPassword: String, completion: @escaping (Bool, String) -> Void) {
        // Ensure password and confirm password match
        if password != confirmPassword {
            completion(false, "Passwords do not match.")
            return
        }
        
        // Create a new instance of Authentication entity
        let newUser = Authentication(context: context)
        print("print the new user \(newUser)")
        
        // Set values for attributes
        newUser.username = username
        newUser.password = password
        newUser.confirmpassword = confirmPassword
        
        // Save context
        do {
            try context.save()
            fetchAndPrintUsers()
            completion(true, "User successfully signed up!")
        } catch {
            print("Failed to save data: \(error)")
            completion(false, "An error occurred while saving user data.")
        }
    }
    
    
    // MARK: - Fetch and Print All Users
        func fetchAndPrintUsers() {
            let fetchRequest: NSFetchRequest<Authentication> = Authentication.fetchRequest()
            
            do {
                let users = try context.fetch(fetchRequest)
                for user in users {
                    print("Username: \(user.username ?? ""), Password: \(user.password ?? ""), Confirm Password: \(user.confirmpassword ?? "")")
                }
            } catch {
                print("Error fetching users: \(error)")
            }
        }
    
    
    // MARK: - Fetch User by Username and Password (Login)
       func fetchUserByUsernameAndPassword(username: String, password: String) -> Authentication? {
           let fetchRequest: NSFetchRequest<Authentication> = Authentication.fetchRequest()
           fetchRequest.predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)
           
           do {
               let users = try context.fetch(fetchRequest)
               return users.first  // Return the first matching user, if any
           } catch {
               print("Error fetching user: \(error)")
               return nil
           }
       }
}
