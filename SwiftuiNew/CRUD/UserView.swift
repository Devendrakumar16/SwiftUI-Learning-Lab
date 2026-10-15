//
//  UserView.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 11/05/26.
//

import SwiftUI

struct Swiftui: View{
    
    @StateObject var vm = UserViewModel()
    var body: some View{
    ZStack {
                // 🔹 Background
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(#colorLiteral(red: 0.18, green: 0.2, blue: 0.24, alpha: 1)),
                        Color(#colorLiteral(red: 0.38, green: 0.45, blue: 0.53, alpha: 1)),
                        Color(#colorLiteral(red: 0.92, green: 0.94, blue: 0.96, alpha: 1))
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
        
        
        
        VStack{
            if vm.isLoading{
                ProgressView()
            }
            
            if !vm.errorMessage.isEmpty{
                Text(vm.errorMessage)
            }
            
            List(vm.user){user in
                VStack(alignment: .leading){
                    Text(user.name)
                        .bold()
                    
                    
                    Text(user.email)
                        .foregroundStyle(Color.gray)
                    
                }
            }   .scrollContentBackground(.hidden)
                .background(Color.clear)
        }
            }
    .task{
        await vm.fetchUser()
    }
        
    }
}


#Preview {
    Swiftui()
}
