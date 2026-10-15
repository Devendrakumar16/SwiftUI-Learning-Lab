//
//  ContentView.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 25/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 10){
            Text("HELLO")
                .font(.title)
                .fontWeight(.bold)
            Text("Welcome")
                .foregroundColor(.gray)
            }
        .frame(maxWidth: .infinity)
        .padding(100)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
        
        .padding()
        
        }
        
    }


#Preview {
    ContentView()
}
