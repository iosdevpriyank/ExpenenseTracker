//
//  APIClient.swift
//  ExpensesTracker
//
//  Created by Akshat Gandhi on 25/05/24.
//

import Foundation
import Combine

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol APIRequest {
    var urlRequest: URLRequest { get }
}

protocol APIClient {
    func execute<T: Decodable>(request: APIRequest, returnType: T.Type) -> AnyPublisher<T, APIError>
}

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}

class ApiClientImpl: APIClient {
    private let urlSession: URLSessionProtocol
    
    init(urlSessionConfiguration: URLSessionConfiguration) {
        urlSession = URLSession(configuration: urlSessionConfiguration)
    }
    
    init(urlSession: URLSessionProtocol) {
        self.urlSession = urlSession
    }
    
    func execute<T: Decodable>(request: APIRequest,
                    returnType: T.Type) -> AnyPublisher<T, APIError> {
        URLSession.shared
            .dataTaskPublisher(for: request.urlRequest)
            .map(\.data)
            .decode(type: returnType.self, decoder: JSONDecoder())
            .mapError({ (error) -> APIError in
                return APIError(error: error,
                                data: nil,
                                httpUrlResponse: nil)
            })
            .eraseToAnyPublisher()
    }
}
