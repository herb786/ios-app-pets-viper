//
//  BusinessTests.swift
//  BusinessTests
//
//  Created by Herbert Caller on 19/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import XCTest
@testable import Business

class BusinessTests: XCTestCase {
    
    class FakeCatService: CatServiceProtocol {
        func findAllCats() -> [CatEntity] {
            let cat1 = CatEntity(id: 1,breed: "b",country: "b",origin: "b",bodyType: "b",coat: "b",pattern: "b",photo: "b")
            let cat2 = CatEntity(id: 2,breed: "b",country: "b",origin: "b",bodyType: "b",coat: "b",pattern: "b",photo: "b")
            return [cat1, cat2]
        }
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCatInteractor() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let catInteractor = CatInteractor()
        catInteractor.catService = FakeCatService()
        XCTAssert(catInteractor.getCatListOnlyWithLongFur().isEmpty)
        XCTAssert(!catInteractor.getCatListOnlyWithPhoto().isEmpty)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
