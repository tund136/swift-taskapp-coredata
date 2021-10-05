//
//  HomeViewModel.swift
//  TaskAppCoreData
//
//  Created by Danh Tu on 05/10/2021.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var content = ""
    @Published var date = Date()
    
    // For NewData Sheet
    @Published var isNewData = false
    
    // Checking and Updating Date
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
}
