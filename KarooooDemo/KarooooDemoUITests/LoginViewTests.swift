//
//  LoginViewTests.swift
//  KarooooDemoUITests
//
//  Created by Muzaffar on 06/01/23.
//
import Foundation
import XCTest

let app = XCUIApplication()

struct Timeouts {
    static let smallTimeout: TimeInterval = 2
    static let mediumTimeout: TimeInterval = 5
    static let largeTimeout: TimeInterval = 10
    static let extraLargeTimeout: TimeInterval = 30
}

final class LoginViewTests: XCTestCase {


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    struct Buttons{
        static let Login = app.webViews.buttons["Log in"]
        static let SignUp = app.buttons["Done"]
    }
    
    struct TextFields {
        static let Email = app.webViews.textFields["Email_TextField"]
        static let Password = app.webViews.secureTextFields["Password_TextField"]
        static let Country = app.webViews.secureTextFields["Country_TextField"]

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
