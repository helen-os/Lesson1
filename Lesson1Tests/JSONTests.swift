// Copyright (C) ABBYY (BIT Software), 1993-2019 . All rights reserved.
// Автор: Sergey Kharchenko
// Описание: @warning добавить описание

import XCTest
@testable import Lesson1

class JSONTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccessedResponse() {
		let successResponse: [String: Any] = ["Name": "Sergey", "id": 1]
		guard let data = successResponse.jsonData else {
			fatalError("Data should exist")
		}
		let helper = FakeNetworkHelper(jsonData: data)
		_ = helper.load(resource: resource) { result in
			switch result {
			case .failure:
				XCTAssert(false, "Request should return success")
			default:
				break
			}
		}
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testFailureParse() {
		let successResponse: [String: Any] = ["name": "Sergey", "id": 1]
		guard let data = successResponse.jsonData else {
			fatalError("Data should exist")
		}
		let helper = FakeNetworkHelper(jsonData: data)
		_ = helper.load(resource: resource) { result in
			switch result {
			case .success:
				XCTAssert(false, "Request should return failure")
			default:
				break
			}
		}
    }
	
	var resource: Resource<JSONObject> {
		Resource<JSONObject>(url: URL(fileURLWithPath: ""), headers: nil)
	}

}

extension Dictionary {
	var jsonData: Data? {
		return try? JSONSerialization.data(withJSONObject: self, options: [])
	}
}
