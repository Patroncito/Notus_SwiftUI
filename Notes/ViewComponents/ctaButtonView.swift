//
//  ctaButtonView.swift
//  Notes
//
//  Created by Alfonso Patron on 17/01/24.
//

import SwiftUI


struct ctaButtonView: View {
    
    @StateObject var viewModel = NotesViewModel()
    
    var body: some View {
        
        Button(action: {
            // Acción del botón flotante
            print("Botón flotante presionado")
            Task{
                await viewModel.fetchNotes()
            }
        }) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                      .frame(width: 50, height: 50)
                      .foregroundStyle(Color.purple) // Color del fondo del botón
                      .clipShape(Circle())
                      .shadow(radius: 5)
        }
        .padding(.trailing, 16)
        .padding(.bottom, 16)
        
        
    }
}

#Preview (traits: .sizeThatFitsLayout){
    ctaButtonView()
}
