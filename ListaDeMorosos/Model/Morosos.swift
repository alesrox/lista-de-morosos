//
//  Morosos.swift
//  ListaDeMorosos
//
//  Created by Alex Ros on 10/10/2023.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Moroso {
    var name: String
    var debt: Float
    
    init(name: String, debt: Float, avatar: Image) {
        self.name = name
        self.debt = debt
    }
}
