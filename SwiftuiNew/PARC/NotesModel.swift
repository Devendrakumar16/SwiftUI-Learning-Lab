//
//  NotesModel.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 04/05/26.
//

import Foundation

struct Note: Identifiable, Codable{
    let id = UUID()
    var title: String
}
