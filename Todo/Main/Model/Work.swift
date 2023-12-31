//
//  Task.swift
//  Task Management
//
//  Created by Balaji on 08/07/23.
//

import SwiftUI
import SwiftData

@Model
class Work: Identifiable {
    var id: UUID
    var taskTitle: String
    var creationDate: Date
    var isCompleted: Bool
    var tint: String
    var priority: Int // Higher values represents higher priority
    var duration: Int // Duration in minutes
    
    init(id: UUID = .init(), taskTitle: String, creationDate: Date = .init(), isCompleted: Bool = false, tint: String, priority: Int, duration: Int){
        self.id = id
        self.taskTitle = taskTitle
        self.creationDate = creationDate
        self.isCompleted = isCompleted
        self.tint = tint
        self.priority = priority
        self.duration = duration
    }
    
    var tintColor: Color {
        switch tint {
        case "TaskColor 1": return .taskColor1
        case "TaskColor 2": return .taskColor2
        case "TaskColor 3": return .taskColor3
        case "TaskColor 4": return .taskColor4
        case "TaskColor 5": return .taskColor5
        default: return .black
        }
    }
}

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
