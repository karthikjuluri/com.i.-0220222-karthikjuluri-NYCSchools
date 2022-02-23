//
//  NetWorkManagerTests.swift
//  20220222-karthikjuluri-NYCSchoolsTests
//
//  Created by karthik on 2/22/22.
//

import XCTest
@testable import _0220222_karthikjuluri_NYCSchools

class NetWorkManagerTests: XCTestCase {
    let networkManager = NetworkManager.shared
    
    func testFetchSchools() {
        
        let exp = expectation(description: "Success Response and fetch School List Data.")
        let testAPI = APIURLConstants.fetchSchools
        
        networkManager.fetchData(urlString: testAPI) { (resultData, error) in
            XCTAssertNil(error)
            
            guard let data = resultData,
                let response = try? JSONDecoder().decode(Array<SchoolModel>.self, from: data as! Data) else {
                    exp.fulfill()
                    
                    return
            }
            
            XCTAssert(response.count > 0, "Schools fetched.")
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    func testFetchSATScores() {
        
        let exp = expectation(description: "Success Response and fetched SAT Scores Data.")
        let testAPI = APIURLConstants.fetchSATScores
        
        networkManager.fetchData(urlString: testAPI) { (resultData, error) in
            XCTAssertNil(error)
            
            guard let data = resultData,
                let response = try? JSONDecoder().decode(Array<SchoolSATScores>.self, from: data as! Data) else {
                    exp.fulfill()
                    
                    return
            }
            
            XCTAssert(response.count > 0, "SAT Scores fetched.")
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 3.0, handler: nil)
    }
}
