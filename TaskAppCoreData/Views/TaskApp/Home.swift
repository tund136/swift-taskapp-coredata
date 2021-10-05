//
//  Home.swift
//  TaskAppCoreData
//
//  Created by Danh Tu on 05/10/2021.
//

import SwiftUI
import CoreData

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    @Environment(\.managedObjectContext) var context
    
    // Fetching Data
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)], animation: .spring()) var results: FetchedResults<Task>
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            VStack {
                
                HStack {
                    Text("Tasks")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(results) { task in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(task.content ?? "")
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text(task.date ?? Date(), style: .date)
                                    .fontWeight(.bold)
                            }
                            .foregroundColor(.black)
                            .contextMenu {
                                Button(action: {
                                    
                                }, label: {
                                    Text("Edit")
                                })
                                
                                Button(action: {
                                    context.delete(task)
                                    try! context.save()
                                }, label: {
                                    Text("Delete")
                                })
                            }
                        }
                    }
                    .padding()
                }
            }
            
            // Add Button
            Button(action: {
                homeData.isNewData.toggle()
            }, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(
                        AngularGradient(gradient: .init(colors: [Color(.systemOrange), Color(.systemRed)]), center: .center)
                    )
                    .clipShape(Circle())
            })
                .padding()
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $homeData.isNewData) {
            NewDataView(homeData: homeData)
        }
    }
}
