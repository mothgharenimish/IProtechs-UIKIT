//
//  OrderCoreDataManger.swift
//  IProtechs-UIKIT
//
//  Created by Nimish Mothghare on 30/04/25.
//

import Foundation
import CoreData
import UIKit

class OrderCoreDataManager {
    
    static let shared = OrderCoreDataManager()
    
    private init() {}
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "IProtechs_UIKIT")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    private var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Add Order
    func addOrder(order: OrderData) {
        let entity = NSEntityDescription.entity(forEntityName: "CustomerOrderData", in: context)!
        let newOrder = NSManagedObject(entity: entity, insertInto: context)
        
        newOrder.setValue(order.orderid, forKey: "orderid")
        newOrder.setValue(order.orderduedate, forKey: "orderduedate")
        newOrder.setValue(order.customername, forKey: "customername")
        newOrder.setValue(order.customeraddress, forKey: "customeraddress")
        newOrder.setValue(order.customercontactno, forKey: "customercontactno")
        newOrder.setValue(order.totalordervalue, forKey: "totalordervalue")
        
        saveContext()
    }
    
    // MARK: - Fetch Orders
    func fetchOrders() -> [OrderData] {
        let fetchRequest: NSFetchRequest<CustomerOrderData> = CustomerOrderData.fetchRequest()
        do {
            let results = try context.fetch(fetchRequest)
            return results.map { OrderData(orderid: $0.orderid ?? "",
                                           orderduedate: $0.orderduedate ?? "",
                                           customername: $0.customername ?? "",
                                           customeraddress: $0.customeraddress ?? "",
                                           customercontactno: $0.customercontactno ?? "",
                                           totalordervalue: $0.totalordervalue ?? "") }
        } catch {
            print("Error fetching orders: \(error)")
            return []
        }
    }
    
    // MARK: - Delete Order
    func deleteOrder(orderID: String) {
        let fetchRequest: NSFetchRequest<CustomerOrderData> = CustomerOrderData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "orderid == %@", orderID)
        
        do {
            let orders = try context.fetch(fetchRequest)
            if let order = orders.first {
                context.delete(order)
                saveContext()
            }
        } catch {
            print("Error deleting order: \(error)")
        }
    }
    
    // MARK: - Update Order
    func updateOrder(order: OrderData) {
        let fetchRequest: NSFetchRequest<CustomerOrderData> = CustomerOrderData.fetchRequest()
           fetchRequest.predicate = NSPredicate(format: "orderid == %@", order.orderid)
           
           do {
               let results = try context.fetch(fetchRequest)
               if let existingOrder = results.first {
                   existingOrder.orderduedate = order.orderduedate
                   existingOrder.customername = order.customername
                   existingOrder.customeraddress = order.customeraddress
                   existingOrder.customercontactno = order.customercontactno
                   existingOrder.totalordervalue = order.totalordervalue
                   saveContext()
               }
           } catch {
               print("Error updating order: \(error)")
           }
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context: \(error)")
            }
        }
    }
}
