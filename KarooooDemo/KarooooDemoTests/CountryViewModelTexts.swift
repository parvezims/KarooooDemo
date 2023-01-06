//
//  CountryViewModelTexts.swift
//  KarooooDemoTests
//
//  Created by Muzaffar on 06/01/23.
//

import XCTest
@testable import KarooooDemo

final class CountryViewModelTexts: XCTestCase {

    let countryViewModel = CountryListViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testCountryList() {
        
        let listcountryList = countryViewModel.fetchCountryList()
        XCTAssertNotNil(listcountryList)
        XCTAssertTrue(listcountryList.count > 0)
        
    }
}
