//
//  TasksView.swift
//  Todo
//
//  Created by KEEVIN MITCHELL on 7/23/23.
//

import SwiftUI
import SwiftData

struct TasksView: View {
    var size: CGSize
    @Binding var currentDate: Date
    /// SwiftData Dynamic Query
    @Query private var tasks: [Work]
    @StateObject var workViewModel: WorkViewModel = .init()
   
    // Smart Sorting
 //   @State private var smartTasks: [Work]
    init(size: CGSize, currentDate: Binding<Date>) {
        self._currentDate = currentDate
        self.size = size
        /// Predicate
        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: currentDate.wrappedValue)
        let endOfDate = calendar.date(byAdding: .day, value: 1, to: startOfDate)!
        let predicate = #Predicate<Work> {
            return $0.creationDate >= startOfDate && $0.creationDate < endOfDate
        }
        /// Sorting
        let sortDescriptor = [
//            SortDescriptor(\Work.creationDate, order: .forward)
            SortDescriptor(\Work.priority, order: .reverse)
        ]
        self._tasks = Query(filter: predicate, sort: sortDescriptor, animation: .snappy)
       
        
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            ForEach(workViewModel.shedulrTasks(tasks: tasks, availableTime: 200)) { task in
                TaskRowView(task: task)
                    .background(alignment: .leading) {
                        if tasks.last?.id != task.id {
                            Rectangle()
                                .frame(width: 1)
                                .offset(x: 8)
                                .padding(.bottom, -35)
                        }
                    }
            }
        }
        .padding([.vertical, .leading], 15)
        .padding(.top, 15)
        .overlay {
            if tasks.isEmpty {
                Text("No Task's Found")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .frame(width: 150)
                    .offset(y: (size.height - 50) / 2)
            }
        }
    }
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

#Preview {
    ContentView()
}
