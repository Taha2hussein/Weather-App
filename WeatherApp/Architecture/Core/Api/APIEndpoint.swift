//
//  APIEndpoint.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import Foundation
import EventHorizon

private enum Constants {
    static let baseURL = "http://api.openweathermap.org/"
    static let weatherPath = "weather"
    static let contentTypeHeader = "Content-Type"
    static let appid = "f5cb0b965ea1564c50c6f1b74534d823"
}

// Endpoints
enum APIEndpointExample {
    case getWeather(search: String)
}

/// Extension to conform to `APIEndpointProtocol`.
extension APIEndpointExample: APIEndpointProtocol {
    
    var apiVersion: String {
        switch self {
        case .getWeather:
            APIVersion.version1.rawValue
        }
        
    }
    
    /// Endpoint base URL.
    var baseURL: String {
        return Constants.baseURL
    }
    
    /// Endpoint HTTP method.
    var method: HTTPMethod {
        switch self {
        case .getWeather:
            return .get
            
        }
    }
    
    /// Endpoint path.
    var path: String {
        switch self {
        case .getWeather:
            return Constants.weatherPath
            
        }
    }
    
    /// Request headers.
    var headers: [String: String] {
        guard let body = body else { return [:] }
        return [Constants.contentTypeHeader: body.contentType]
    }
    
    /// Request URL parameters.
    var urlParams: [String: any CustomStringConvertible] {
        switch self {
        case .getWeather(let search):
            return [
                "q": search,
                "appid": Constants.appid
            ]
        }
    }
    
    /// Request body data.
    var body: HTTPBody? {
        return nil
        
    }
}
