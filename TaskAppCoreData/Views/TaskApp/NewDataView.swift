//
//  NewDataView.swift
//  TaskAppCoreData
//
//  Created by Danh Tu on 05/10/2021.
//

import SwiftUI

struct NewDataView: View {
    @ObservedObject var homeData: HomeViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Add New Task")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
                
                Spacer()
            }
            .padding()
            
            TextEditor(text: $homeData.content)
                .padding()
            
            Divider()
                .padding(.horizontal)
            
            HStack {
                Text("When")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding()
            
            HStack {
                DateButton(title: "Today", homeData: homeData)
                
                Spacer()
                
                DateButton(title: "Tomorrow", homeData: homeData)
                
                Spacer()
                
                // Date Picker
                DatePicker("", selection: $homeData.date, displayedComponents: .date)
                    .labelsHidden()
            }
            .padding()
            
            // Add Button
            Button(action: {
                
            }, label: {
                Label(title: {
                    Text("Add Now")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }, icon: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                })
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 30)
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
                    .cornerRadius(8)
            })
                .padding()
        }
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .bottom))
    }
}

