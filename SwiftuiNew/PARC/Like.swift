//
//  Like.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 16/03/26.
//
import SwiftUI

struct Like: View{
   
    @State private var likes = 0
    @State private var isLiked = false
    
    var body: some View{
        
        VStack(spacing: 20){
            HStack(spacing: 15){
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    Text("\(likes) likes")
                
            }
            
            
            Button(isLiked ? "UnLike" : "Like"){
                if isLiked {
                    // Currently liked -> Unlike: decrement
                    likes = max(0, likes - 1)
                } else {
                    // Currently not liked -> Like: increment
                    likes += 1
                }
                isLiked.toggle()
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.red.opacity(0.3))
        .cornerRadius(15)
        .padding()
    }
}


#Preview{
    Like()
}

