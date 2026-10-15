//
//  Untitled.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 25/02/26.
//

import SwiftUI

struct Counter: View{
    @State private var count = 0
    @State private var counterZeroText = false
    @State private var resetButton = false
    var body: some View{
        VStack(spacing: 20){
            Text("Count \(count)")
                .font(.title)
                .foregroundStyle(.red)
            HStack(spacing: 20){
                Button("Increase"){
                    count += 1
                    counterZeroText = false
                    resetButton = true
                }
                .padding(15)
                .background(Color.red.opacity(0.1))
                .foregroundStyle(.black)
                .cornerRadius(15)
                
                
                if count > 0 {
                    Button("Reset"){
                        count = 0
                        counterZeroText = false
                    }
                    .padding(15)
                    .background(Color.red.opacity(0.1))
                    .foregroundStyle(.black)
                    .cornerRadius(15)
                    
                }
               
                
                
                
                Button("Decrease"){
                    if(count == 0){
                        counterZeroText = true
                        count = 0
                        
                    }else{
                        count -= 1
                        counterZeroText = false
                    }
                }
                .padding(15)
                .background(Color.red.opacity(0.1))
                .foregroundStyle(.black)
                .cornerRadius(15)
            }

            
            if counterZeroText{
                Text("counter is already 0")
                    //.hidden()
            }
            
        }
       
        .frame(maxWidth: .infinity)
        .padding(30)
        .background(Color.red.opacity(0.1))
        .cornerRadius(15)
        .padding()
   
       
    }
        
    
}

#Preview {
    Counter()
}
