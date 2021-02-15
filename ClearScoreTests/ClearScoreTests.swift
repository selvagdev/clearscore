//
//  ClearScoreTests.swift
//  ClearScoreTests
//
//  Created by Lshiva on 14/02/2021.
//

import Foundation
import XCTest
@testable import ClearScore

class ClearScoreTests: XCTestCase {

    //TEST API ENDPOINT WITH VALID REQUEST
    func test_Api_Endpoint_With_Valid_Request() {
        let creditReportNetwork = CreditReportNetwork()
        
        let expectation = self.expectation(description: "ValidRequest_Returns_Response")
        creditReportNetwork.performRequest { (value, error) in
            XCTAssertNotNil(value)
            XCTAssertNil(error)
            XCTAssertNotNil(value?.creditReportInfo?.score)
            expectation.fulfill()
        }
            waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    //TEST API ENDPOINT WITH INVALID URL
    func test_Api_Endpoint_With_Unsupported_URL() {
        let creditReportNetwork = CreditReportNetwork(apiURL: "INVALID_API_URL")
        
        let expectation = self.expectation(description: "ValidRequest_Returns_Response")
        creditReportNetwork.performRequest { (value, error) in
            XCTAssertNil(value)
            XCTAssertNotNil(error)
            XCTAssertEqual("unsupported URL", error?.localizedDescription)
            expectation.fulfill()
        }
            waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    private let score =  CreditReportInfo(score: 400)
    
    private let creditReportMockData = Data("""
    {
        "score": 514,
        "scoreBand": 4
    }
  """.utf8)

    //TEST API FOR MISSING DATA
    func test_Api_Decoding_when_Missing_Data() {
        XCTAssertNotEqual(score, try JSONDecoder().decode(CreditReportInfo.self, from: creditReportMockData))
    }
    
    //TODO: MOCK JSON RESPONSE TO TEST SCORE
    func testDecoding_whenCreditReportInfo_returns_score() throws {
        let _ = try? JSONDecoder().decode(CreditReportInfo.self, from: creditReportMockData)
        
        
    }
    
    //TODO: MOCK URLSESSION DATA
    
    //TODO: TEST CODABLES LIKE DATATYPES, MISSING TYPES FOR SCORE INFO,REPORT INFO, SUMMARY ETC,.
    
}
    
