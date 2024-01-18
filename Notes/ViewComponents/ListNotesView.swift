//
//  ListNotesView.swift
//  Notes
//
//  Created by Alfonso Patron on 17/01/24.
//

import SwiftUI

struct ListNotesView: View {
    @StateObject var viewModel = NotesViewModel()

    var body: some View {
        
        List(viewModel.notes){ note in 
            RowListNoteView(viewModel: viewModel, note: note)
                .listRowBackground(Color.purpleStrong)

            }
        
            .listRowSpacing(10)
            .navigationViewStyle(StackNavigationViewStyle())

            .onAppear{
                Task{
                    await viewModel.fetchNotes()
                }
            }
      
    }
}

#Preview {
    ListNotesView()
}
