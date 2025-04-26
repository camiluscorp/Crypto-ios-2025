//
//  Endpoint.swift
//  Crypto-iOS
//
//  Created by Flavio Quisiguiña on 26/4/25.
//
protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
  var baseURL: String {
    //return "https://a27c2c52-aa18-451d-8b25-24fc7448c9f7.mock.pstmn.io/v3/"
      return "https://rest.coincap.io/v3/"
  }
}
