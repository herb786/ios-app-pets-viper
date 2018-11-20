//
//  DogServiceProtocol.swift
//  Business
//
//  Created by Herbert Caller on 20/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import Foundation

public protocol DogServiceProtocol {
    
    func findAllDogs() -> [DogEntity]
    
}
