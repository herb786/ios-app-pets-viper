//
//  ApiService.swift
//  Service
//
//  Created by Herbert Caller on 19/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import Business
import Foundation

extension CatService: CatServiceProtocol {
    
    public func findAllCats() -> [CatEntity] {
        if cats.isEmpty {
            self.connectToSyncService()
        }
        return cats
    }
    
}

public class CatService: BaseService {
    
    var cats: [CatEntity] = []
    var catServiceDelegate: CatServiceDelegate?
    
    override init() {
        super.init()
        self.endPoint = "api/cats"
    }
    
    override public func dealWithJsonData(data: Data) {
        do {
            let jsonString = try JSONSerialization.jsonObject(with: data, options:
                JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
            for case let item in jsonString! {
                if let cat = CatEntity(json: item as! [String : Any]) {
                    self.cats.append(cat)
                }
            }
        } catch {}
    }
    
}
