//
//  UssrrViewModel.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 11/05/26.
//

import SwiftUI

class UserrViewModel:ObservableObject{
    @Published var user: [UUser] = []
    @Published var isLoading:Bool = false
    @Published var errorMessage = ""
   // @Published var searachText = ""
    @Published var searchText = ""
    
    
    let apiManager = APIManagerr()
    
    @MainActor
    func fetchUser() async{
        isLoading = true
        errorMessage = ""
        
        do{
            let users: [UUser] = try await apiManager.fetchData(
                from: "https://jsonplaceholder.typicode.com/users"
            )
            
            self.user = users
            isLoading = false
        }catch{
            
        }
    }
    
    var filteredUsers: [UUser] {

            let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

            if trimmed.isEmpty {
                return user
            }

            return user.filter {
                $0.name.localizedCaseInsensitiveContains(trimmed)
            }
        }
}
