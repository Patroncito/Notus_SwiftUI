//
//  NoteModel.swift
//  Notes
//
//  Created by Alfonso Patron on 16/01/24.
//

import Foundation


struct Note: Codable, Identifiable {
    var id: Int
    var name: String
    var tasktext: String
}

struct Note_POST : Codable {
    var name: String
    var tasktext: String
}
