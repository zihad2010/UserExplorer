//
//  APIRouter.swift
//  UserListApp
//
//  Created by Asraful Alam on 20/7/25.
//

import Alamofire
import Foundation

enum APIRouter: URLRequestConvertible {
    case getUsers

    var method: HTTPMethod {
        switch self {
        case .getUsers: return .get
        }
    }

    var path: String {
        switch self {
        case .getUsers: return "/users"
        }
    }

    func asURLRequest() throws -> URLRequest {
        let baseURL = try "https://jsonplaceholder.typicode.com".asURL()
        var request = URLRequest(url: baseURL.appendingPathComponent(path))
        request.method = method
        return request
    }
}
