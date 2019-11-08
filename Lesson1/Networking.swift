// Copyright (C) ABBYY (BIT Software), 1993-2019. All rights reserved.
// Описание: Протокол отправки запросов в сеть

import Foundation

/// Для тестов
/// Протокол отправки запросов в сеть
protocol Networking {
	/// Метод отправляющий запрос в сеть на основе ресурсов
	///
	/// - Parameters:
	///   - resource: ресурс формирующий запрос
	///   - completionHandler: результат выполнения запроса, возвращает ответ от сервера
	/// - Returns: возвращает объект для возможности отмены запроса
	func execute<A>(_ resource: Resource<A>, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> Cancellation?
}
