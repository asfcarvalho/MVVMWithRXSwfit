//
//  People.swift
//  ViperWithRXSwift
//
//  Created by asfcarvalho on 09/10/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import Foundation

struct People: Codable {
    let count: Int?
    var next: String?
    let previous: String?
    var person: [Person]?
    
    enum CodingKeys: String, CodingKey {
        case count, next, previous
        case person = "results"
    }
}
