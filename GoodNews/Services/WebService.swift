//
//  WebService.swift
//  GoodNews
//
//  Created by user on 10/9/22.
//

import Foundation

protocol WebService {
    func getArticles(url: URL,completion:(([Article])->Void)?)
}
class ArticleWebService:WebService {
    func getArticles(url: URL,completion:(([Article])->Void)?) {
        URLSession.shared.dataTask(with: url){ data, response , error in
            if let error = error{
                print(error.localizedDescription)
                completion?([])
            }
            else if let data = data {
                
                do {
                let aticleDic:ArticleList = try JSONDecoder().decode(ArticleList.self, from: data)
                    let articles = aticleDic.articles
                     completion?(articles)
                } catch let error {
                    print(error.localizedDescription)
                    completion?([])
                }
            }
            else {
                completion?([])

            }
        }.resume()
    }
}
