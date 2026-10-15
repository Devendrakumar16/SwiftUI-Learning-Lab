//
//  ViewModel.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 04/05/26.
//

import SwiftUI

class NotesViewModel: ObservableObject{
    
    
    init(){
        loadNotes()
        
    }
    @Published var notes: [Note] = [
  
    ]
    
    @Published var inputText: String = ""
    
    func addNote(){
        guard !inputText.isEmpty else {return}
        notes.append(Note(title: inputText))
        saveNotes()
        inputText = ""
    }
    
    func delete(at offsets: IndexSet){
        notes.remove(atOffsets: offsets)
        saveNotes()
    }
    var filteredNotes: [Note] {
        if inputText.isEmpty {
            return notes
        } else {
            return notes.filter {
                $0.title.lowercased().contains(inputText.lowercased())
            }
        }
    }
    
    func update(note:Note, newTitle:String){
        if let index = notes.firstIndex(where: {$0.id == note.id}){
            notes[index].title = newTitle
            saveNotes()
        }
    }
    
    func saveNotes(){
        if let data = try?JSONEncoder().encode(notes){
            UserDefaults.standard.set(data, forKey: "notes_key")
        }
    }
    
    func loadNotes(){
        if let data = UserDefaults.standard.data(forKey: "notes_key"),
           let saved = try? JSONDecoder().decode([Note].self, from: data){
            notes = saved
        }
    }
}
