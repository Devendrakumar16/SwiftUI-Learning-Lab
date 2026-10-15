///Users/devendra.kumar/Desktop/SwiftuiNew/SwiftuiNew/CRUD/UserViewModel.swift
//  ApiManager.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 11/05/26.
//

import Foundation

class APIManager{
    func fetchData<T: Decodable>(from urlString: String) async throws -> T{
        
        
        guard let url  = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode  == 200 else{
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
