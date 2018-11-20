//
//  DogServiceDelegate.swift
//  Business
//
//  Created by Herbert Caller on 20/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import Foundation

public protocol DogServiceDelegate {
    
    func onDogResponse(cats: [DogEntity])
    func onFailureResponse(error: Error)
    
}
