//
//  User.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 11/05/26.
//

import Foundation

struct UUser: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let website: String
}
