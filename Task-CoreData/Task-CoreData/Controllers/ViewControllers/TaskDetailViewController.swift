//
//  TaskDetailViewController.swift
//  Task-CoreData
//
//  Created by Jenny Morales on 4/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - Properties
    var task: Task?
    var date: Date?
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let taskName = taskNameTextField.text, !taskName.isEmpty,
              //jennyrm - ASK
              let taskNotes = taskNotesTextView.text else { return }
        if let task = task {
            TaskController.shared.update(task: task, name: taskName, notes: taskNotes, dueDate: date)
        } else {
            TaskController.shared.createTaskWith(name: taskName, notes: taskNotes, dueDate: date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dueDatePickerChanged(_ sender: UIDatePicker) {
        date = taskDueDatePicker.date
    }
    
    //MARK: - Functions
    func updateViews() {
        if let task = task {
            taskNameTextField.text = task.name
            taskNotesTextView.text = task.notes
            taskDueDatePicker.date = task.dueDate ?? Date()
        }
    }
}//End of class
