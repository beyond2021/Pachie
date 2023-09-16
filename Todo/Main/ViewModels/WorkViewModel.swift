//
//  WorkViewModel.swift
//  Pachie
//
//  Created by KEEVIN MITCHELL on 8/21/23.
//

import SwiftUI
class WorkViewModel: ObservableObject {
    
    
    // Alogorithm that give smart results
    // GREEDY ALGORITHM`
    func shedulrTasks(tasks: [Work], availableTime: Int) -> [Work] {
        var remainingTime = availableTime
        var sheduleTasks: [Work] = []
        // Sort task based on  priority Highest priority first
        let sortedTasks = tasks.sorted{$0.priority > $1.priority}
        for task in sortedTasks {
            if task.duration <= remainingTime {
                // shedule the task if it fits within the remaining time
                sheduleTasks.append(task)
                remainingTime -= task.duration
            }
        }
        return sheduleTasks
    }
     
    
}
