//
//  Song_ListTests.swift
//
//  Created by C Rus on 09/05/16.
//  Copyright © 2016 crus. All rights reserved.
//

import XCTest
@testable import Song_List

class Song_ListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testTextGeneratorRandomTextLength() {
        // Test if the generated text has proper length
        let count = 200
        let randomText = TextGenerator.getRandomText(count)
        XCTAssertEqual(randomText.characters.count, count)
    }
    
    func testDataManagerLoadJsonItemsCount() {
        // Test if <count> items are loaded from json db
        let count = 100
        let jsonData = DataManager.shared.loadJsonWithSongs(DataManager.shared.jsonName)
        XCTAssertEqual(jsonData?.count, count)
    }

    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
