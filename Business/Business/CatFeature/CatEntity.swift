//
//  CatEntity.swift
//  Business
//
//  Created by Herbert Caller on 19/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import Foundation

public extension CatEntity {
    
    init?(json: [String: Any]) {
        guard let id = json["id"] as? Int,
            let breed = json["breed"] as? String,
            let origin = json["origin"] as? String,
            let country = json["country"] as? String,
            let bodyType = json["body_type"] as? String,
            let pattern = json["pattern"] as? String,
            let photo = json["photo"] as? String,
            let coat = json["coat"] as? String
            else {
                return nil
        }
        self.id = id
        self.breed = breed
        self.country = country
        self.origin = origin
        self.bodyType = bodyType
        self.coat = coat
        self.pattern = pattern
        self.photo = photo
    }
    
}

public struct CatEntity {
    let id: Int?
    let breed: String?
    let country: String?
    let origin: String?
    let bodyType: String?
    let coat: String?
    let pattern: String?
    let photo: String?
}
