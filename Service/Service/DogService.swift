//
//  DogService.swift
//  Service
//
//  Created by Herbert Caller on 20/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import Foundation
import Business

extension DogService: DogServiceProtocol {
    
    public func findAllDogs() -> [DogEntity] {
        if dogs.isEmpty {
            self.connectToSyncService()
        }
        return dogs
    }
    
}

public class DogService: BaseService {
    
    var dogs: [DogEntity] = []
    
    override public init() {
        super.init()
        self.endPoint = "api/dogs"
    }
    
    override public func dealWithJsonData(data: Data) {
        do {
            let jsonString = try JSONSerialization.jsonObject(with: data, options:
                JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
            for case let item in jsonString! {
                if let dog = DogEntity(json: item as! [String : Any]) {
                    self.dogs.append(dog)
                }
            }
        } catch {}
    }
    
}
