//
//  NewsData.swift
//  SenpiperAssignment
//
//  Created by rahul kaushik on 19/11/22.
//

import Foundation

struct NewsData : Codable {
    let articles : [ArticleModel]
}

struct ArticleModel : Codable {
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
}

