//
//  NewsResponse.swift
//  newsapp-alamofire
//
//  Created by Ridho Pratama on 16/11/18.
//  Copyright © 2018 ridhopratama. All rights reserved.
//

import Foundation

struct ArticleSource: Decodable {
    let id: String?
    let name: String?
}

struct Article: Decodable {
    let source: ArticleSource?
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
}

struct ArticleResponse: Decodable {
    let articles: [Article]?
    let status: String?
    let totalResults: Int?
}
