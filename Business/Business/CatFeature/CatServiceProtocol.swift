//
//  ApiProtocolService.swift
//  Business
//
//  Created by Herbert Caller on 19/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import Foundation

public protocol CatServiceProtocol {
    
    func findAllCats() -> [CatEntity]

}
