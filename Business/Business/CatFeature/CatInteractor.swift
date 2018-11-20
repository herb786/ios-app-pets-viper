//
//  CatInteractor.swift
//  Business
//
//  Created by Herbert Caller on 19/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import Foundation

public class CatInteractor: CatCaseProtocol {
    
    var catService: CatServiceProtocol? = nil
    
    public init() {
        
    }
    
    public func getCatListOnlyWithPhoto() -> [CatEntity] {
        var newList: [CatEntity] = []
        let cats = catService?.findAllCats()
        for case let cat in cats! {
            if (!(cat.photo?.isEmpty)!) {
                newList.append(cat)
            }
        }
        return newList
    }
    
    public func getCatListOnlyWithLongFur() ->  [CatEntity] {
        var newList: [CatEntity] = []
        let cats = catService?.findAllCats()
        for case let cat in cats! {
            if (cat.coat?.contains("Long"))! {
                newList.append(cat)
            }
        }
        return newList
    }
    
}
