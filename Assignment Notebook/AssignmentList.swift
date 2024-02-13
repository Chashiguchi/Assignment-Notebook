//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by chase Hashiguchi on 2/12/24.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items = [AssignmentItem(priority: "High", description: "Take out trash", dueDate: Date()),
                            AssignmentItem(priority: "Medium", description: "Pick up clothes", dueDate: Date()),
                            AssignmentItem(priority: "Low", description: "Eat a donut", dueDate: Date())]
}
