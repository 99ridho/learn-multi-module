//
//  DataResponse+Extension.swift
//  learnios
//
//  Created by Ridho Pratama on 07/10/18.
//  Copyright © 2018 ridhopratama. All rights reserved.
//

import Alamofire
import Foundation

extension DataResponse {
    public func map<T: Decodable>(to: T.Type, atKeyPath keyPath: String? = nil, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
        var jsonData: Data?
        if let keyPath = keyPath {
            guard let dictionary = (self.result.value as? NSDictionary)?.value(forKeyPath: keyPath) as? [String:Any] else {
                return nil
            }
            
            guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: []) else {
                return nil
            }
            
            jsonData = data
        } else {
            jsonData = data
        }
        
        guard let data = jsonData else {
            return nil
        }
        
        return try? decoder.decode(T.self, from: data)
    }
}
