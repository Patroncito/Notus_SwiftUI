//
//  NotesListView.swift
//  Notes
//
//  Created by Alfonso Patron on 16/01/24.
//


import SwiftUI

struct NotesListView: View {
    @StateObject var viewModel = NotesViewModel()

    var body: some View {
        NavigationView {
            
            
            List(viewModel.notes) { note in
                
                NoteRowView(viewModel: viewModel, note: note)
                
            }
            
            .navigationBarTitle("Notes")
            .navigationBarItems(trailing: NavigationLink("Add Note", destination: SheetAddNote(viewModel: viewModel)))

            
            //             .navigationBarItems(trailing: NavigationLink("Add Note", destination: AddNoteView(viewModel: viewModel)))

            .onAppear {
                Task{
                    await viewModel.fetchNotes()
                }
            }
        }
    }
    

    
} // BODY





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView()
    }
}
