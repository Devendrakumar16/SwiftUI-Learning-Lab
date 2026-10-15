//
//  Day10MVVM.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 04/05/26.
//

import SwiftUI

struct Day10MVVM: View {
    
    @StateObject var vm = NotesViewModel()
    @FocusState private var isFieldFocused: Bool
    @State private var selectedNote: Note?
    @State private var showEdit = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                // 🔹 Background
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(#colorLiteral(red: 0.18, green: 0.2, blue: 0.24, alpha: 1)),
                        Color(#colorLiteral(red: 0.38, green: 0.45, blue: 0.53, alpha: 1)),
                        Color(#colorLiteral(red: 0.92, green: 0.94, blue: 0.96, alpha: 1))
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack {
                    HStack {
                        TextField("Add Note", text: $vm.inputText)
                            .focused($isFieldFocused)
                        
                        HStack(spacing: 18){
                            Button(action: {
                                vm.addNote()
                                isFieldFocused = false
                                print("Search tapped with text: \($vm.inputText)")
                            }) {
                                Image(systemName: "plus")
                                    .foregroundStyle(Color.blue)
                            }
                        }
                    }
                    .padding(10)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(15)
                    .padding()
                    
                    Spacer()
                    VStack{
                        List {
                            ForEach(vm.notes) { note in
                                
                                Text(note.title)
                                    .swipeActions(edge: .trailing){
                                        Button(role: .destructive){
                                            if let index = vm.notes.firstIndex(where: {$0.id == note.id}){
                                                vm.notes.remove(at: index)
                                                vm.saveNotes()
                                            }
                                        }label:{
                                            Label("Delete", systemImage:"trash")
                                        }
                                        
                                        Button{
                                            selectedNote = note
                                            showEdit = true
                                            //                                        NavigationLink {
                                            
                                            
                                            // }
                                        }label: {
                                            Label("Edit", systemImage: "pencil")
                                        }
                                        
                                    }
                                    .tint(.blue)
                            }
                        }
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                    }
                    .sheet(item: $selectedNote) { note in
                        EditNote(note: note, vm: vm)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    Day10MVVM()
}

