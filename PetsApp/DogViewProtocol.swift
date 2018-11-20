//
//  DogViewProtocol.swift
//  PetsApp
//
//  Created by Herbert Caller on 20/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import Foundation
import Business

protocol DogViewProtocol {
    
    func showDogs(dogs: [DogEntity])
    func showProgressBar()
    func hideProgressBar()
    
}
