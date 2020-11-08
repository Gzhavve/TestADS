//
//  TestDateLabelProtocol.swift
//  TestADSTests
//
//  Created by Sarah Hebert on 2020-11-08.
//

import XCTest
@testable import TestADS

class TestDateLabelProtocol: XCTestCase, DateLabelProtocol {
    
    var stackView: UIStackView?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_getDateAndTime() {
        
        let date = self.getDateAndTime()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        XCTAssertNotNil(dateFormater.date(from: date))
    }
}
