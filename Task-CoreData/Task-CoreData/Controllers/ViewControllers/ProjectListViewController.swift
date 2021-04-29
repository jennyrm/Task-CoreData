//
//  ProjectListViewController.swift
//  Task-CoreData
//
//  Created by Jenny Morales on 4/28/21.
//

import UIKit

class ProjectListViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var projectNameTextField: UITextField!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //MARK: - Actions
    @IBAction func createNewProjectButtonTapped(_ sender: UIButton) {
        if let projectName = projectNameTextField.text, !projectName.isEmpty {
            ProjectController.shared.createProjectWith(name: projectName, date: Date())
        }
        tableView.reloadData()
        projectNameTextField.text = ""
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTaskListVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                guard let destinationVC = segue.destination as? TaskListTableViewController else { return }
                let projectToSend = ProjectController.shared.projects[indexPath.row]
                destinationVC.project = projectToSend
            }
        }
    }
}//End of class

//MARK: - Extensions
extension ProjectListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProjectController.shared.projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath)
        let project = ProjectController.shared.projects[indexPath.row]
        cell.textLabel?.text = project.name
        return cell
    }
}//End of extension
