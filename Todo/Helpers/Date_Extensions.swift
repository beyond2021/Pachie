//
//  Date_Extensions.swift
//  Todo
//
//  Created by KEEVIN MITCHELL on 7/11/23.
//

import SwiftUI

//Date extension needed to build UI
extension Date {
    //Custom Date Format
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    /// Checking wether the date is today
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    //Check if the date is the same hour
    var isSameHour: Bool {
        return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedSame
    }
    var isPast: Bool {
        return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedAscending
    }
    
    
    
    
    
    /// Fetching week based on agiven date
    func fetchWeek(_ date: Date = .init()) -> [WeekDay] {
        let calender = Calendar.current
        let startOfDate = calender.startOfDay(for: date)
        
        var week: [WeekDay] = []
        let weekForDate = calender.dateInterval(of: .weekOfMonth, for: startOfDate)
        guard let startOfTheWeek = weekForDate?.start else  {
            return []
        }
        /// Iterating to get thje full week
        (0..<7).forEach { index in
            /*
             Weve already fetcxhed the current weeks start date. We can now use
             this iteration week dates
             
             */
            if let weekDay = calender.date(byAdding: .day, value: index, to: startOfTheWeek) {
                week.append(.init(date: weekDay))
                
            }
            
        }
        return week
    }
    
    //Creating Next Week based on last (Current Week's) date
    func createNextWeek() -> [WeekDay] {
        let calender = Calendar.current
        let startOfLastDate = calender.startOfDay(for: self)
        guard let nextDate = calender.date(byAdding: .day, value: 1, to: startOfLastDate) else {
            return []
        }
        return fetchWeek(nextDate)
    }
    //Creating Previous Week based on first (Current Week's) date
    func createPreviousWeek() -> [WeekDay] {
        let calender = Calendar.current
        let startOfFirstDate = calender.startOfDay(for: self)
        guard let previousDate = calender.date(byAdding: .day, value: -1, to: startOfFirstDate) else {
            return []
        }
        return fetchWeek(previousDate)
    }
    
    
    struct WeekDay: Identifiable {
        var id: UUID = .init()
        var date: Date
    }
    
    
}
