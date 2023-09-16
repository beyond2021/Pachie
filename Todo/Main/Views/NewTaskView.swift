//
//  NewTaskView.swift
//  Todo
//
//  Created by KEEVIN MITCHELL on 7/21/23.
//

import SwiftUI

struct NewTaskView: View {
    // View Properties
    @Environment(\.dismiss) private var dismiss
    // Model Context For Saving Data
    @Environment(\.modelContext) private var context
    @State private var taskTitle: String = ""
    @State private var taskDate: Date = .init()
    @State private var taskColor: String = "TaskColor 1"
    @State private var taskPriority: String = ""
    @State private var taskDuration: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .tint(.red)
                
            })
            .padding(.top, 50)
            .hSpacing(.leading)
            VStack(alignment: .center, spacing: 8, content: {
                Text("Task Title")
                    .font(.largeTitle)
                    .fontWeight(.semibold)//
                    .foregroundStyle(.black)
                TextField("Go for a walk!", text: $taskTitle)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
                Text("Task Priority")
                    .font(.title)
                    .fontWeight(.semibold)//
                    .foregroundStyle(.black)
                TextField("Task priorty from 1 - 10", text: $taskPriority)
                    .keyboardType(.numberPad)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
                Text("Length of task")
                    .font(.title)
                    .fontWeight(.semibold)//
                    .foregroundStyle(.black)
                TextField("How long will this task take in minutes!", text: $taskDuration)
                    .keyboardType(.numberPad)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
            })
            .padding(.top, 5)
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Text("Task Date")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    DatePicker("", selection: $taskDate)
                        .datePickerStyle(.compact)
                        .scaleEffect(0.9, anchor: .leading)
                })
             
                // Giving color space for tapping
                .padding(.trailing, -15)
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Task Color")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    let colors: [String] = (1...5).compactMap { index -> String in
                        return "TaskColor \(index)"
                    }
                    HStack(spacing: 0) {
                        ForEach(colors, id: \.self) { color in
                            Circle()
                                .fill(Color(color))
                                .frame(width: 20, height: 20)
                                .background(content: {
                                    Circle()
                                        .stroke(lineWidth: 2)
                                        .opacity(taskColor == color ? 1 : 0)
                                })
                                .hSpacing(.center)
                                .contentShape(.rect)
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        taskColor = color
                                        
                                    }
                                }
                            
                        }
                    }
                })
               
          
            }
            .padding(.top, 5)
            
            Spacer(minLength: 0)
            Button(action: {
                // Conversion
                let duration: Int = Int(taskDuration) ?? 0
                let priority: Int = Int(taskPriority) ?? 0
                // Saving Task!
                let task = Work( taskTitle: taskTitle, creationDate: taskDate,  tint: taskColor, priority: priority, duration: duration)
                do {
                    context.insert(task)
                    try context.save()
                    // Success!
                    dismiss()
                } catch {
                    print(error.localizedDescription)
                }
                
            }) {
                Text("Create Task")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .textScale(.secondary)
                    .foregroundStyle(.black)
                    .hSpacing(.center)
                    .padding(.vertical, 15)
                    .background(Color(taskColor), in: .rect(cornerRadius: 10))
            }
            .disabled(taskTitle == "" )
            .opacity(taskTitle == "" ? 0.5 : 1)
        })
        .padding(15)
    }
}

#Preview {
    NewTaskView()
        .vSpacing(.bottom)
}
