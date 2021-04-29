//
//  TaskListTableViewController.swift
//  Task-CoreData
//
//  Created by Jenny Morales on 4/27/21.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 75
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ProjectController.shared.fetchTasks()
        tableView.reloadData()
    }
    
    //MARK: - Properties
    var project: Project?
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return project?.toTasks?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        let taskArr = (project?.toTasks)?.allObjects
        let task = taskArr?[indexPath.row]
        cell.task = task as? Task
//        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }  
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDO
        let project = self.project
        guard let destinationVC = segue.destination as? TaskDetailViewController else { return }
        destinationVC.project = project
        
        if segue.identifier == "toTaskDetailVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                guard let destinationVC = segue.destination as? TaskDetailViewController else { return }
                let taskArr = (project?.toTasks)?.allObjects
                let taskToSend = taskArr?[indexPath.row] as? Task
                destinationVC.task = taskToSend
            }
        }
    }
}//End of class

extension TaskListTableViewController: TaskCompletionDelegate {
    func taskCellButtonTapped(_ sender: TaskTableViewCell) {
        guard let task = sender.task else { return }
        TaskController.toggleIsComplete(task: task)
        sender.updateViews()
    }
}//End of extension
