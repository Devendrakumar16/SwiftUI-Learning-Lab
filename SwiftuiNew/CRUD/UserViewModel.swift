//
//  UserViewModel.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 07/05/26.
//
import SwiftUI

class UserViewModel:ObservableObject{
    @Published var user: [User] = []
    @Published var isLoading:Bool = false
    @Published var errorMessage = ""
    
    let apiManager = APIManager()
    
    @MainActor
    func fetchUser() async{
        isLoading = true
        errorMessage = ""
    
        do{
            let users: [User] = try await apiManager.fetchData(
                from: "https://jsonplaceholder.typicode.com/users"
            )
            self.user = users
        } catch{
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
