//
//  Home.swift
//  TaskAppCoreData
//
//  Created by Danh Tu on 05/10/2021.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("Button")
        })
            .sheet(isPresented: $homeData.isNewData) {
                NewDataView(homeData: homeData)
            }
    }
}
