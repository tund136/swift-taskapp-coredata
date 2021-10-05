//
//  HomeViewModel.swift
//  TaskAppCoreData
//
//  Created by Danh Tu on 05/10/2021.
//

import Foundation
import CoreData

class HomeViewModel: ObservableObject {
    @Published var content = ""
    @Published var date = Date()
    
    // For NewData Sheet
    @Published var isNewData = false
    
    // Checking and Updating Date
    
    // Storing Update Item
    @Published var updateItem: Task!
    
    let calendar = Calendar.current
    
    func checkDate() -> String {
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInTomorrow(date) {
            return "Tomorrow"
        } else {
            return "Other day"
        }
    }
    
    func updateDate(value: String) {
        if value == "Today" {
            date = Date()
        } else if value == "Tomorrow" {
            date = calendar.date(byAdding: .day, value: 1, to: Date())!
        } else {
            // Do something
        }
    }
    
    func writeData(context: NSManagedObjectContext) {
        
        // Updating item
        if updateItem != nil {
            // Means update old data
            updateItem.date = date
            updateItem.content = content
            
            try! context.save()
            
            // Removing updateItem if successful
            updateItem = nil
            isNewData.toggle()
            content = ""
            date = Date()
            
            return
        }
        
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        
        // Saving data
        do {
            try context.save()
            
            // Success means closing view
            isNewData.toggle()
            content = ""
            date = Date()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func editItem(item: Task) {
        updateItem = item
        // Toggling the newDataView
        date = item.date!
        content = item.content!
        isNewData.toggle()
    }
}
