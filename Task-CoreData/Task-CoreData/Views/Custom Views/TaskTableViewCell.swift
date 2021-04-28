//
//  TaskTableViewCell.swift
//  Task-CoreData
//
//  Created by Jenny Morales on 4/27/21.
//

import UIKit

//MARK: - Protocol
protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}
class TaskTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    @IBOutlet weak var dueDate: UILabel!
    
    //MARK: - Properties
    weak var delegate: TaskCompletionDelegate?
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Actions
    @IBAction func completionButtonTapped(_ sender: UIButton) {
        delegate?.taskCellButtonTapped(self)
    }
    
    //MARK: - Functions
    func updateViews() {
        guard let task = task else { return }
        taskNameLabel.text = task.name
        dueDate.text = task.dueDate?.formatToString()
        let complete = UIImage(systemName: "checkmark.square")
        let incomplete = UIImage(systemName: "square")
        task.isComplete ? completionButton.setImage(complete, for: .normal) : completionButton.setImage(incomplete, for: .normal)
    }
}
