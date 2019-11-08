// Copyright (C) ABBYY (BIT Software), 1993-2019 . All rights reserved.
// Автор: Sergey Kharchenko
// Описание: @warning добавить описание

import Foundation
@testable import Lesson1

class FakeNetworkHelper: NetworkHelperProtocol {
	var jsonData: Data
	
	init(jsonData: Data) {
		self.jsonData = jsonData
	}
	
	func load<A>(resource: Resource<A>, completion: @escaping (Result<A, Error>) -> ()) -> Cancellation? {
		do {
			let result = try resource.parse(jsonData)
			completion(.success(result))
		} catch let error {
			completion(.failure(error))
		}
		return nil
	}
}
