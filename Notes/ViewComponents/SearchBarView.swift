//
//  SearchBarView.swift
//  Notes
//
//  Created by Alfonso Patron on 17/01/24.
//

import SwiftUI


struct SearchBarView: View {
    @State private var searchText = "Search notes..."

    var body: some View {
            VStack {
                SearchBar(searchText: $searchText)

            }
    }
}


struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        
        
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.purpleMedium)
                        .frame(height: 25)
                        .padding(.leading, 15)


                    TextField("Search notes...", text: $searchText)
                        .padding(.vertical, 10)
                        .padding(.leading, 4)
                        .cornerRadius(16)
                        .foregroundColor(Color.purpleMedium)

                }
            .padding(.vertical, 8)
            .background(Color.purpleStrong)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.leading, 10)
                
                
                HStack{
                    Button(action: {}, label: {
                        ZStack {
                            Color.purpleMedium
                                .cornerRadius(16)
                                //.foregroundStyle(Color.purpleMedium)
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.black)

                                
                        }
                       
                    })
                }
                .frame(width: 50, height: 50)
                .padding(.horizontal, 10)

                
                
            
            }
            
            
            
          
        }
        .padding(.top, 10)
    }
}

#Preview {
    SearchBarView()
}

