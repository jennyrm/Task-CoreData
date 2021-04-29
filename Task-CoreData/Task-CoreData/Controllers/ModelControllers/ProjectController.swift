//
//  ProjectController.swift
//  Task-CoreData
//
//  Created by Jenny Morales on 4/28/21.
//

import CoreData

class ProjectController {
    //MARK: - Properties
    static let shared = ProjectController()
    
    var projects = [Project]()
    
    private lazy var fetchRequest: NSFetchRequest<Project> = {
        let request = NSFetchRequest<Project>(entityName: "Project")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() {}
    
    //MARK: - CRUD
    func fetchTasks() {
        let projects = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        self.projects = projects
    }
    
    func createProjectWith(name: String, date: Date?) {
        let project = Project(name: name, date: date)
        projects.append(project)
        print(projects)
        
        CoreDataStack.saveContext()
    }
    
    func addTaskTo(project: Project, task: Task) {
        project.addToToTasks(task)
        
        CoreDataStack.saveContext()
    }
    
}//End of class
