//
//  CategoriesScrollView.swift
//  Notes
//
//  Created by Alfonso Patron on 17/01/24.
//

import SwiftUI

struct CategoriesScrollView: View {
    
    
    
    var arrayCategories : [ItemCategoryView] = [
        ItemCategoryView(iconCategory: "doc.text", nameCategory: "All", isSelected: true),
        ItemCategoryView(iconCategory: "folder", nameCategory: "Folder", isSelected: false),
        ItemCategoryView(iconCategory: "star", nameCategory: "Important", isSelected: false),
        ItemCategoryView(iconCategory: "gamecontroller", nameCategory: "Gaming", isSelected: false)
        
    ]
    
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
           
            HStack {
                ForEach(arrayCategories, id: \.nameCategory){ category in
                    category
                    
                }
            }
          
                
        }
        .padding(.horizontal, 10)
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CategoriesScrollView()
        
}
