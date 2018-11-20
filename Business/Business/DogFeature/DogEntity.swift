//
//  DogEntity.swift
//  Business
//
//  Created by Herbert Caller on 19/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import Foundation

public extension DogEntity {
    
    init?(json: [String: Any]) {
        guard let id = json["id"] as? Int,
            let breed = json["breed"] as? String,
            let origin = json["origin"] as? String,
            let pictures = json["pictures"] as? [String]
            else {
                return nil
        }
        self.id = id
        self.breed = breed
        self.origin = origin
        self.pictures = pictures
    }
    
}

public struct DogEntity {
    let id: Int?
    let breed: String?
    let origin: String?
    let pictures: [String]?
}
