//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by chase Hashiguchi on 2/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems =
    [AssignmentItem(priority: "High", description: "Take out trash", dueDate: Date()),
     AssignmentItem(priority: "Medium", description: "Pick up clothes", dueDate: Date()),
     AssignmentItem(priority: "Low", description: "Eat a donut", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItems) {item in
                    Text(item.description)
                }
                .onMove {indices, newOffset in
                    assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { indexSet in
                    assignmentItems.remove(atOffsets: indexSet)
                }
            }
                .navigationBarTitle("Assignments", displayMode: .inline)
                .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable {
    var id = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
}
