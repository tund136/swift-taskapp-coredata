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
            
        }, label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical)
                .padding(.horizontal, 20)
                .background(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                Color(.systemOrange),
                                Color(.systemRed)
                            ]
                        ),
                        startPoint: .leading,endPoint: .trailing
                    )
                )
                .cornerRadius(6)
        })
    }
}

