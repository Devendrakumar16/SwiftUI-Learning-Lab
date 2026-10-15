//
//  User.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 07/05/26.
//

import Foundation

struct User: Codable, Identifiable{

    let id: Int
    let name: String
    let email: String
}
