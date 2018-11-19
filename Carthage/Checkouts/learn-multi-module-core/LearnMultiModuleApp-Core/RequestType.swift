//
//  RequestType.swift
//  learnios
//
//  Created by Ridho Pratama on 07/10/18.
//  Copyright © 2018 ridhopratama. All rights reserved.
//

import Alamofire
import Foundation

public protocol RequestTypeProtocol {
    var baseUrl: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters { get }
    var headers: [String : String] { get }
    var parameterEncoding: ParameterEncoding { get }
}
