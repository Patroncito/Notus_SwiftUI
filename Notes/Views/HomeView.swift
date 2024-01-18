//
//  HomeView.swift
//  Notes
//
//  Created by Alfonso Patron on 17/01/24.
//

import SwiftUI



struct HomeView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            VStack(alignment: .leading){
                Spacer()
                UserHeaderView()
                SearchBarView()
                Text("My Notes")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                CategoriesScrollView()
                ListNotesView()
            }
                ctaButtonView()

            
            
        }

            
            

        }
       
    } // BODY


#Preview {
    HomeView()
}


