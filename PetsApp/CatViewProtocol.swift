//
//  CatViewProtocol.swift
//  PetsApp
//
//  Created by Herbert Caller on 20/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import Foundation
import Business

protocol CatViewProtocol {
    
    func showCats(cats: [CatEntity])
    func showProgressBar()
    func hideProgressBar()
    
}
