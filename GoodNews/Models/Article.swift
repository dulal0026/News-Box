//
//  Article.swift
//  GoodNews
//
//  Created by user on 10/9/22.
//

import Foundation

struct ArticleList:Decodable {
    var articles:[Article]
}

struct Article: Decodable {
    var title:String?
    var description:String?
    var author:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    var source:Source?
}


struct Source: Decodable {
    var name:String?
}

