//
//  Project39UITests.swift
//  Project39UITests
//
//  Created by Grant Watson on 12/1/22.
//

import XCTest

final class Project39UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitialStateIsCorrect() {
        XCUIApplication().activate()
        let table = XCUIApplication().tables
        XCTAssertEqual(table.cells.count, 7, "There should be 7 rows initially")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testUserFilteringByString() {
        XCUIApplication().activate()
        
        let app = XCUIApplication()
        app.navigationBars["Title"].buttons["Filter"].tap()
        
        let filterAlert = app.alerts["Filter words"].scrollViews.otherElements
        filterAlert.collectionViews.cells.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("test")
        filterAlert.buttons["OK"].tap()
        
        XCTAssertEqual(app.tables.cells.count, 56, "There should be 56 words matching 'test'")
        
    }
}
