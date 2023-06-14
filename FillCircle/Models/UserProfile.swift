//
//  UserProfile.swift
//  FillCircle
//
//  Created by Jaden Nation on 6/9/23.
//

import Foundation

class UserProfile: NSObject {
    var name: String
    var joinDate: Date
    var completedRunPresets: [UUID] = []
    
    init(name: String, joinDate: Date = Date(), completedRunPresets: [UUID] = []) {
        self.name = name
        self.joinDate = joinDate
        self.completedRunPresets = completedRunPresets
        super.init()
    }
}
