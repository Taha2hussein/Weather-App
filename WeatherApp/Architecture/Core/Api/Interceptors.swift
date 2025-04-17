//
//  Interceptors.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import EventHorizon
enum Interceptors {
    static let example: [any NetworkInterceptorProtocol] = [
        LoggingInterceptor(),
        RetryInterceptor(),
        RequestTimeoutInterceptor(timeout: 10)
    ]
}
