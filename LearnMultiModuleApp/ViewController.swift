//
//  ViewController.swift
//  LearnMultiModuleApp
//
//  Created by Ridho Pratama on 19/11/18.
//  Copyright © 2018 ridhopratama. All rights reserved.
//

import Alamofire
import LearnMultiModuleApp_Core
import UIKit

enum NewsRequest: RequestTypeProtocol {
    case everything(q: String, from: String)
    
    var baseUrl: URL {
        guard let url = URL(string: "https://newsapi.org/v2") else {
            fatalError("URL invalid")
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case .everything:
            return "/everything"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters {
        switch self {
        case let .everything(q, from):
            return [
                "q": q,
                "from": from,
                "sortedBy": "publishedAt",
                "apiKey": "72fbf5e64b3448d2a8ebbb71fc9dba7f"
            ]
        }
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
}
class ViewController: UIViewController {

    let dispatcher = RequestDispatcher<NewsRequest>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dispatcher.dispatch(request: .everything(q: "bitcoin", from: "2018-10-19"), mapResponseTo: ArticleResponse.self) { (res, err) in
            print(res)
        }
    }


}

