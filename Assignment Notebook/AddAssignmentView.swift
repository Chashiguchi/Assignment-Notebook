//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by chase Hashiguchi on 2/12/24.
//

import SwiftUI

struct AddAssignmentView: View {
    @Environment(\.presentationMode) var presentationMode
    static let cources = ["Math", "Science", "History", "English", "Language"]
    @ObservedObject var assignmentList: AssignmentList
    @State private var cource = ""
    @State private var description = ""
    @State private var dueDate = Date()
    var body: some View {
        NavigationView {
            Form{
                Picker("Cource", selection: $cource) {
                    ForEach(Self.cources, id: \.self) {cource in
                        Text(cource)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save"){
                if cource.count > 0 && description.count > 0 {
                    let item = AssignmentItem(id: UUID(), cource: cource, description: description, dueDate: dueDate)
                    assignmentList.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}
