//
//  NoteRowView.swift
//  Notes
//
//  Created by Alfonso Patron on 16/01/24.
//
import SwiftUI

struct NoteRowView: View {
    
    @ObservedObject var viewModel: NotesViewModel

    var note: Note

    var body: some View {
        VStack(alignment: .leading,spacing: 4){
            Text(note.name)
                .font(.system(size: 24))
                .bold()
                
            Text(note.tasktext)
                .font(.footnote)
        }
    
            .swipeActions {
                Button(role: .destructive) {
                    // Acción de eliminación
                    deleteNote()
                } label: {
                    Image(systemName: "trash")
                }
            }
    }

    private func deleteNote() {
        // Puedes implementar la lógica de eliminación aquí
        // Puedes llamar a viewModel.deleteNoteById(id: note.id) u otra lógica de eliminación
        print("Eliminar nota con ID: \(note.id)")
        
        Task{
            await viewModel.deleteNoteById(id: note.id)

        }
        
    }
}

