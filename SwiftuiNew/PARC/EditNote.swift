//
//  EditNote.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 05/05/26.
//

import SwiftUI

struct EditNote:View{
    
    @State private var updatedText: String = ""
    
    @ObservedObject var vm:NotesViewModel
    @Environment(\.dismiss) var dismiss
    
    init(note: Note, vm: NotesViewModel) {
        self.note = note
        self.vm = vm
        _updatedText = State(initialValue: note.title)
    }
    
    var note:Note
    
    var body: some View{
    
        
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
                Text("Edit Note")
                    .font(.title2)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color.white.opacity(0.7))
                    )
                    .padding()
                
                TextField("", text: $updatedText)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color.white.opacity(0.7))
                    )
                    .padding(.horizontal, 18)
                
                
                Button("SAVE"){
                    vm.update(note: note, newTitle: updatedText)
                    dismiss()
                    
                }
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color.white.opacity(0.7))
                )
                .padding()
                
                    
            }
            
        }
    }
}

#Preview {
    EditNote(
        note: Note(title: ""),
        vm: NotesViewModel()
    )
}

