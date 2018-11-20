//
//  CatServiceDelegate.swift
//  Business
//
//  Created by Herbert Caller on 20/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import Foundation

public protocol CatServiceDelegate {
    
    func onCatResponse(cats: [CatEntity])
    func onFailureResponse(error: Error)
    
}
