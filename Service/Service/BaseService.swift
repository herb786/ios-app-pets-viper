//
//  BaseService.swift
//  Service
//
//  Created by Herbert Caller on 20/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import Foundation


public class BaseService {
    
    var endPoint: String? = nil
    let baseUrl = "https://hacagusae.appspot.com/"
    let semaphore = DispatchSemaphore(value: 0)
    
    public func connectToSyncService() {
        guard let endPoint = endPoint
            else {
                return
        }
        guard let url = URL.init(string: baseUrl + endPoint)
            else {
                return
        }
        let task = URLSession.shared.dataTask(
            with: url,
            completionHandler: {
                _ = $2
                _ = $1
                if let data = $0 {
                    self.dealWithJsonData(data: data)
                }
                self.semaphore.signal()
        })
        task.resume()
        _ = semaphore.wait(timeout: .distantFuture)
    }
    
    public func connectToService() {
        guard let endPoint = endPoint
            else {
                return
        }
        guard let url = URL.init(string: baseUrl + endPoint)
            else {
                return
        }
        let task = URLSession.shared.dataTask(
            with: url,
            completionHandler: {
                _ = $2
                _ = $1
                if let data = $0 {
                    self.dealWithJsonData(data: data)
                }
        })
        task.resume()
    }
    
    open func dealWithJsonData(data: Data) {
        
    }
    
}
