//
//  NavigationTabBar.swift
//  Notes
//
//  Created by Alfonso Patron on 17/01/24.
//

import SwiftUI

struct NavigationTabBar : View {
    
    @State var isSelected = "house"
    @Namespace var animation
    var customPurpleHard : Color = Color.purpleHard
    var customPurpleMedium : Color = Color.purpleMedium

    
    init() {
        
        //UITabBar.appearance().isTranslucent = true
    }
    @State var xAxis: CGFloat = 0
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView(selection: $isSelected){
                
                HomeView()
                    .tag("house")
                   
                
                Color(.purpleMedium)
                    .tag("gearshape")
                    .ignoresSafeArea(.all, edges: .all)

                
                Color(.purpleHard)
                    .tag("person")
                    .ignoresSafeArea(.all, edges: .all)
                
            }
            
            
            HStack(spacing: 0){
                
                    ForEach(tabsIcons, id: \.self){item in
                        
                        
                        
                        GeometryReader { reader in
                            Button(action: {
                                withAnimation(.spring()){
                                    isSelected = item
                                    xAxis = reader.frame(in: .global).minX
                                    print(isSelected)
                                }
                            }, label: {
                                
                                getImageSelec(item: item)
                                    .resizable()
                                    .renderingMode(.template
                                    ).aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .foregroundStyle(isSelected == item  ? .purpleMedium : .gray)
                                    .padding(isSelected == item ? 15 : 0)
                                    .background(Color(customPurpleHard).opacity(isSelected == item ? 1 : 0).clipShape(Circle()))
                                    .matchedGeometryEffect(id: item, in: animation)
                                    .offset(x: isSelected == item ? (reader.frame(in: .global).minX - reader.frame(in: .global).midX) : 0 ,y: isSelected == item ? -50 : 0)
                                
                        })
                            .onAppear(perform: {
                                if item == tabsIcons.first {
                                    xAxis = reader.frame(in: .global).minX
                                }
                            })
                        }
                        .frame(width: 25, height: 30)
                        if item != tabsIcons.last {Spacer(minLength: 0)}
                        
                    }
                

                
            }
            
        
            .padding(.horizontal, 30)
            .padding(.vertical)
            .background(Color(customPurpleHard).clipShape(CustomShape(xAxis: xAxis)).cornerRadius(12))
            .padding(.horizontal)
            // Button edge
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)

         
        } // ZTACK
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    private func getImageSelec (item: String) -> Image{
        
        switch(item){
            
        case "house":
            return Image(systemName: ("\(item).fill"))
            
        case "gearshape":
            return Image(systemName: ("\(item).fill"))
                
        case "person":
            return Image(systemName: ("\(item).fill"))
            
  
                
                
                
            
            
        default:
            return Image(systemName: "user")
        }
        
        
    }
}

var tabsIcons = ["house","gearshape", "person"]

struct CustomShape : Shape   {
    var xAxis: CGFloat
    
    var animatableData: CGFloat {
        get{return xAxis}
        set {xAxis = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = xAxis
            
            path.move(to: CGPoint(x: center - 60, y: 0))
            
            let to1 = CGPoint(x: center, y: 35)
            let control1 = CGPoint(x: center - 25, y: 0)
            let control2 = CGPoint(x: center - 25, y: 35)
            
            let to2 = CGPoint(x: center + 50, y: 0)
            let control3 = CGPoint(x: center + 25, y: 35)
            let control4 = CGPoint(x: center + 25, y: 0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)



            
        }
    }
    
}

#Preview {
    NavigationTabBar()
}


