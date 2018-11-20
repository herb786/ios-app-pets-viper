//
//  ServiceTests.swift
//  ServiceTests
//
//  Created by Herbert Caller on 19/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import XCTest
@testable import Service

class ServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCatService() {
        let catService = CatService()
        catService.connectToSyncService()
        XCTAssert(catService.findAllCats().count > 0)
    }
    
    func testDogService() {
        let dogService = DogService()
        dogService.connectToService()
        var count = 0
        repeat {
            count += 1
        } while count < 1000*1000*200
        XCTAssert(dogService.findAllDogs().count > 0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
