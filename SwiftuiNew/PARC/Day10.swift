//
//  Day10.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 04/05/26.
//

import SwiftUI

struct Day10:View {
    
    @State private var selectedTab = 0
    
    var body: some View {
//        ZStack{
//
//            // 🔹 Background
//            LinearGradient(
//                gradient: Gradient(colors: [
//                    Color(#colorLiteral(red: 0.18, green: 0.2, blue: 0.24, alpha: 1)),
//                    Color(#colorLiteral(red: 0.38, green: 0.45, blue: 0.53, alpha: 1)),
//                    Color(#colorLiteral(red: 0.92, green: 0.94, blue: 0.96, alpha: 1))
//                ]),
//                startPoint: .topLeading,
//                endPoint: .bottomTrailing
//            )
//            .ignoresSafeArea()
//            ScrollView{
//                VStack{
//                    Text("TAB BAR")
//                        .font(.title)
//                        .bold()
//                        .foregroundStyle(Color.purple.opacity(0.7))
//
//
//                }
//
//
//        }
            TabView(selection: $selectedTab){
                
                Day9()
                    .tabItem{
                        Image(systemName: selectedTab == 0 ? "figure.run" : "figure.run.circle")
                        Text("Activity")
                    }
                    .tag(0)
                
                Day8()
                    .tabItem{
                        Image(systemName: selectedTab == 1 ? "chart.bar.fill" : "chart.bar")
                        Text("Data")
                    }
                    .tag(1)
                
                Validation()
                    .tabItem{
                        Image(systemName: selectedTab == 2 ? "person.badge.key.fill" : "person.badge.key")
                        Text("Validate")
                    }
                    .tag(2)
                
             
                
            }
            
        
        
        
    }
}


#Preview {
    Day10()
}

