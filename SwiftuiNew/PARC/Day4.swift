//
//  Day4.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 23/03/26.
//

import SwiftUI

struct TaskItem: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var desc: String
}

struct Day4: View{
    
    @State private var taskInput: String = ""
    @State private var taskDesc: String = ""
    @State private var tasks: [TaskItem] = []
    @State private var hasAttemptedSubmit: Bool = false
    @State private var isLiked:Bool = false
    
    var body: some View{
        NavigationStack{
            VStack(spacing: 15){
                Text("Enter Task")
                    .frame(maxWidth: .infinity ,alignment: .leading)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .bold()
                TextField("Enter task", text: $taskInput)
                    .padding(15)
                    .background(Color.white)
                    .cornerRadius(15)
                    .foregroundStyle(.secondary, .primary)
                Text("Enter Task description")
                    .frame(maxWidth: .infinity ,alignment: .leading)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .bold()
                
                TextEditor(/*"Enter task desc", */text: $taskDesc)
                    .frame(height: 100)
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(15)
                    .foregroundStyle(.secondary, .primary)
                
                
                
                HStack{
                    
                    if hasAttemptedSubmit && taskInput.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        Image(systemName: "")
                        Text("Input field cannot be empty")
                            .font(.footnote)
                            .foregroundStyle(.red)
                    }
                }
                
                Button("Submit"){
                    hasAttemptedSubmit = true
                    if !taskInput.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        let newItem = TaskItem(title: taskInput, desc: taskDesc)
                        tasks.append(newItem)
                        taskInput = ""
                        taskDesc = ""
                        hasAttemptedSubmit = false
                        print(newItem.id)
                    }
                    
                }
                .padding(15)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(15)
                .font(.title2)
                
                //            Spacer()
                
                List {
                    
                    ForEach(tasks) { item in
                        HStack(spacing: 12) {
                            Button(action: {
                                isLiked.toggle()
                            }) {
                                Image(systemName: isLiked ? "largecircle.fill.circle" : "circle")
                                    .font(.system(size: 30))
                                    .foregroundColor(isLiked ? .red : .gray)
                            }
                            .buttonStyle(.plain) // ensure this button doesn't adopt row tap behavior

                            // Make only the text area navigate
                            NavigationLink(destination: TaskDetails(task: item.title, desc: item.desc)) {
                                Text(item.title)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
                .padding(5)
                .background(.white)
                .cornerRadius(15)
                
                
                
            }
            .padding(15)
            .background(Color.pink.opacity(0.2))
            .cornerRadius(15)
            .padding()
            
            
        }
        
    }
    
    
    func deleteItem(at offsets: IndexSet){
        tasks.remove(atOffsets: offsets)
        
    }
}


struct TaskDetails: View{
    
     var task:String
    var desc:String
    
    var body: some View{
        VStack{
            Text("\(task)")
            Text("\(desc)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(15)
                .background(.yellow)
                .padding()
            Spacer()
        }
    }
}

#Preview {
    Day4()
}

#Preview{
    TaskDetails(task: "", desc: "")
}

