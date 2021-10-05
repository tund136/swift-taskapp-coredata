//
//  DateButton.swift
//  TaskAppCoreData
//
//  Created by Danh Tu on 05/10/2021.
//

import SwiftUI

struct DateButton: View {
    var title: String
    @ObservedObject var homeData: HomeViewModel
    
    var body: some View {
        Button(action: {
            homeData.updateDate(value: title)
        }, label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(homeData.checkDate() == title ? .white : .gray)
                .padding(.vertical)
                .padding(.horizontal, 20)
                .background(
                    homeData.checkDate() == title ?
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                Color(.systemOrange),
                                Color(.systemRed)
                            ]
                        ),
                        startPoint: .leading,endPoint: .trailing
                    )
                    :
                        LinearGradient(gradient: .init(colors: [Color.white]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(6)
        })
    }
}

