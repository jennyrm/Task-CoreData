//
//  DateFormatter+Extras.swift
//  Task-CoreData
//
//  Created by Jenny Morales on 4/27/21.
//

import Foundation

extension Date {
    func formatToString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
}
