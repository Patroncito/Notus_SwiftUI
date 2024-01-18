//
//  UserHeaderView.swift
//  Notes
//
//  Created by Alfonso Patron on 17/01/24.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 50)

    }
    
    func iconModifier() -> some View {
        self.imageModifier()
        
        .frame(maxWidth: 50)
        .foregroundStyle(Color.purple)
        .opacity(0.5)
        
    }
}

struct UserHeaderView: View {
    var body: some View {
        
        
        
        let imageURL = "https://unavatar.io/github/patroncito"
        
        HStack {
            VStack(alignment: .leading, spacing: 4){
                
                //Text to user and welcome
                Text("Welcome Back")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text("Alfonso Patrón")
                    .font(.title2)
                    .bold()
                
                
               
            }
            
            Spacer()
            
            AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
                       
                       switch phase {
                       case .success(let image):
                           image.imageModifier()
                               .transition(.scale)
                               .clipShape(Circle())
                               
                       case .empty:
                           Image(systemName: "photo.circle.fill").iconModifier()

                       case .failure(_):
                           Image(systemName: "ant.circle.fill").iconModifier()
                       @unknown default:
                           ProgressView()
                       }
                       
                   }
         
            
            

        }
        .padding(.horizontal, 10)
       
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    UserHeaderView()
}



