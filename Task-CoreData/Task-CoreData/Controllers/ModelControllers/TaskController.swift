//
//  TaskController.swift
//  Task-CoreData
//
//  Created by Jenny Morales on 4/27/21.
//

import CoreData

class TaskController {
    //MARK: - CRUD
    static func createTaskWith(project: Project, name: String, notes: String?, dueDate: Date? ) {
        let newTask = Task(project: project, name: name, notes: notes, dueDate: dueDate)
        ProjectController.shared.addTaskTo(project: project, task: newTask)
    }
    
    static func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
    }
    
//    static func deleteTask(task: Task) {
//        if let index = tasks.firstIndex(of: task) {
//            tasks.remove(at: index)
//        }
//    }
    
    static func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
    }
    
}//End of class
