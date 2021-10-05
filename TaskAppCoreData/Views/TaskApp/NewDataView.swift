//
//  NewDataView.swift
//  TaskAppCoreData
//
//  Created by Danh Tu on 05/10/2021.
//

import SwiftUI

struct NewDataView: View {
    @ObservedObject var homeData: HomeViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            HStack {
                Text("\(homeData.updateItem == nil ? "Add New" : "Update") Task")
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
                homeData.writeData(context: context)
            }, label: {
                Label(title: {
                    Text(homeData.updateItem == nil ? "Add Now" : "Update")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }, icon: {
                    Image(systemName: homeData.updateItem == nil ? "plus" : "square.and.arrow.down")
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
            // Disabling button when no data
                .disabled(homeData.content == "" ? true : false)
                .opacity(homeData.content == "" ? 0.5 : 1)
        }
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .bottom))
    }
}

