//
//  Friend.swift
//  Birthdays
//
//  Created by Hem Gai on 7/11/25.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name : String
    var birthday : Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    
    
}
