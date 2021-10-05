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
}
