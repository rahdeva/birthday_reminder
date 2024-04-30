//
//  Friend.swift
//  BirthdayReminder
//
//  Created by MacBook Air on 30/04/24.
//

import Foundation
import SwiftData

@Model
class Friend{
    let name : String
    let birthday : Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    
    var isBirthdayToday : Bool {
        Calendar.current.isDateInToday(birthday)
    }
    
}
