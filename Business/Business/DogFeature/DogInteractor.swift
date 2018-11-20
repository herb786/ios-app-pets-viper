//
//  DogInteractor.swift
//  Business
//
//  Created by Herbert Caller on 19/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import Foundation


public class DogInteractor: DogCaseProtocol {
    
    let dogService: DogServiceProtocol? = nil
    
    public init() {
        
    }
    
    public func getDogListOnlyWithSmallPhoto() -> [DogEntity] {
        var newList: [DogEntity] = []
        let dogs = dogService?.findAllDogs()
        for case let dog in dogs! {
            if (!(dog.pictures?[0].isEmpty)!) {
                newList.append(dog)
            }
        }
        return newList
    }
}
