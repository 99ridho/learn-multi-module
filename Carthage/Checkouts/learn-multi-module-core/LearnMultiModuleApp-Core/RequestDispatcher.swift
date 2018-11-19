//
//  RequestDispatcher.swift
//  learnios
//
//  Created by Ridho Pratama on 07/10/18.
//  Copyright © 2018 ridhopratama. All rights reserved.
//

import Alamofire
import Foundation

public protocol RequestDispatcherProtocol {
    associatedtype R: RequestTypeProtocol
    func dispatch<ResponseType: Decodable>(request: R, mapResponseTo responseType: ResponseType.Type, completion: ((ResponseType?, Error?) -> Void)?)
}

public class RequestDispatcher<Request: RequestTypeProtocol>: RequestDispatcherProtocol {
    public func dispatch<ResponseType: Decodable>(
        request: Request,
        mapResponseTo responseType: ResponseType.Type,
        completion: ((ResponseType?, Error?) -> Void)?
    ) {
        
        let completeUrl = request.baseUrl.appendingPathComponent(request.path)
        
        Alamofire.request(
            completeUrl,
            method: request.method,
            parameters: request.parameters,
            encoding: request.parameterEncoding,
            headers: request.headers)
        .responseJSON { (response) in
            let mappedResponse = response.map(to: ResponseType.self)
            
            completion?(mappedResponse, response.error)
        }
        
    }
}
