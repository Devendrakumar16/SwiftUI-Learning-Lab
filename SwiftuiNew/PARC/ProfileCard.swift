//
//  ProfileCard.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 27/02/26.
//

import SwiftUI

struct ProfileCard: View {
    
    @State private var isFollowed = false
    var body: some View {
        VStack(spacing: 5){
            Image(systemName: "person.crop.circle")
                .font(.system(size: 100))
                .foregroundStyle(Color.gray)
            Text("NAME")
                .font(.title)
                .padding(5)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                //.background(Color.blue.opacity(0.2))
                .cornerRadius(12)
            Text("DESIGNATION")
                .font(.title)
                .foregroundStyle(Color.gray)
                //.padding(5)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                //.background(Color.blue.opacity(0.2))
                .cornerRadius(12)
            
           
            if isFollowed{
                Button("FOLLOW"){
                    isFollowed.toggle()
                }
                .foregroundStyle(Color.black)
                .font(.title)
                .padding(5)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(20)
            }else{
                Button("UNFOLLOW"){
                    isFollowed.toggle()
                }
                .foregroundStyle(Color.white)
                .font(.title)
                .padding(5)
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                .cornerRadius(20)
            }
           
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.red.opacity(0.3))
        .cornerRadius(15)
        .padding()
    }
}

#Preview {
    ProfileCard()
}
