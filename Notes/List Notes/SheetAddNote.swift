//
//  SheetAddNote.swift
//  Notes
//
//  Created by Alfonso Patron on 16/01/24.
//

import SwiftUI

struct SheetAddNote: View {
    
        @ObservedObject var viewModel: NotesViewModel
        @State private var name = ""
        @State private var tasktext = ""
    
    var body: some View {
        
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Task Text", text: $tasktext)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
          
            Button("Add Note"){
                Task {
                      let newNote = Note_POST(name: name, tasktext: tasktext)
                      await viewModel.addNote(newNote)
                  }
            }
            .padding()
           
                           
            
            
        } // VSTACK
        
    }
}

#Preview {
    SheetAddNote(viewModel: NotesViewModel())
}
