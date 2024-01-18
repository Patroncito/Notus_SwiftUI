//
//  ItemCategoryView.swift
//  Notes
//
//  Created by Alfonso Patron on 17/01/24.
//

import SwiftUI

struct ItemCategoryView: View {
    
    var iconCategory : String
    var nameCategory : String
    @State var isSelected : Bool

    
    var body: some View {
        
        Button(action: {
            
            if (isSelected == true) {
                isSelected = false
            } else if isSelected == false {
                isSelected = true
            }
        }, label: {
            
            ZStack{
                Color(isSelected ? Color.purpleMedium : Color.purpleStrong)
                    .cornerRadius(100)

                HStack{
                    Image(systemName: iconCategory)
                    Text(nameCategory)
                }
                .foregroundStyle(isSelected ? Color.accentColor : Color.purpleMedium)

                .padding(.horizontal, 20)

               
            }
            .frame(height: 40)
            .fixedSize(horizontal: true, vertical: false)
            .padding(.top, 20)


        })
        
        
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ItemCategoryView(iconCategory: "doc.text", nameCategory: "Items", isSelected: false)
}
