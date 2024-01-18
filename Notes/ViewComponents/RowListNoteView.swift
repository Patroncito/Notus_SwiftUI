//
//  RowListNoteView.swift
//  Notes
//
//  Created by Alfonso Patron on 17/01/24.
//

import SwiftUI

struct RowListNoteView: View {
    
    @ObservedObject var viewModel: NotesViewModel

    
    var note : Note
    var body: some View {
        
        
        
        HStack(spacing: 20){
            
            ZStack{
                Color.purpleHard.opacity(0.8)
                    .cornerRadius(8)
                Image(systemName: "gamecontroller")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .foregroundStyle(Color.purpleMedium)
                    .padding(4)
            }
            .frame(width: 50, height: 50)
            VStack( alignment: .leading, spacing: 10){
                HStack {
                    Text(note.name)
                        .font(.title3)
                    Spacer()
                    Text("3:48 pm")
                        .foregroundStyle(.gray)
                        .font(.footnote)


                }
                Text(note.tasktext)
                    .font(.footnote)

            }
        }
        .padding(.vertical, 6)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
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



