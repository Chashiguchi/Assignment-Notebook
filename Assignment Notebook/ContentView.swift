//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by chase Hashiguchi on 2/1/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignmentView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentList.items) { item in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(item.priority)
                                .font(.headline)
                            Spacer()
                            Text(item.dueDate, style: .date)
                        }
                        .padding(.vertical, 8) // Add vertical padding so it doesnt interefere with the top of the text
                        .padding(.horizontal, 8)// Add horizOntal padding so it doesnt interfere with the side of the text
                        .background(Color.cyan) // Set background color
                        .border(Color.black, width: 2) // Add border
                        .cornerRadius(7) // Rounded corners
                        Text(item.description)
                            .padding(.leading, 8)
                            .padding(.vertical, 8) // Add vertical padding
                            .padding(.horizontal, 4)// Add horizOntal padding
                            .background(Color.cyan) // Set background color
                            .border(Color.black, width: 2) // Add border
                            .cornerRadius(7) // Rounded corners
                    }
                }
                .onMove { indices, newOffset in
                    assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { indexSet in
                    assignmentList.items.remove(atOffsets: indexSet)
                }
            }
            .sheet(isPresented: $showingAddAssignmentView) {
                AddAssignmentView(assignmentList: assignmentList)
            }
            .navigationBarTitle("Assignments", displayMode: .inline)
            .navigationBarItems(leading: EditButton(), trailing: Button(action: { showingAddAssignmentView = true }) {
                Image(systemName: "plus")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
}
