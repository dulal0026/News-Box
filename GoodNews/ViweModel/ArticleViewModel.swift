//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by user on 10/9/22.
//

import Foundation

protocol ArticleListViewModelDelegate:AnyObject {
    func reloadData()
}
class ArticleListViewModel {
    var articles:[Article] = []
    weak var delegate:ArticleListViewModelDelegate?
    
    var webService:WebService
    init() {
        webService = ArticleWebService()
        let urlStr = "https://newsapi.org/v2/top-headlines?country=us&apiKey=cc311a5d1ce644949f480880c127a282"
        let url:URL = URL(string: urlStr)!
        webService.getArticles(url: url) { (newsHeadLines) in
            DispatchQueue.main.async {
                self.articles = newsHeadLines
                self.delegate?.reloadData()
            }
        }
    }
}

extension ArticleListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    func numberOfRowsInSection(_ section:Int) -> Int {
        return self.articles.count
    }
    func articleAtIndex(_ index:Int) -> ArticleViewModel{
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    func didSelectArticleAt(_ index:Int)->ArticleViewModel{
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}


struct ArticleViewModel {
    private let article:Article
}

extension ArticleViewModel{
    init(_ article:Article) {
        self.article = article
    }
}

extension ArticleViewModel{
    var title: String{
        return article.title ?? ""
    }
    var desription:String {
        return article.description ?? ""
    }
    var publishDate: String{
        guard let pubDate = article.publishedAt, let date = pubDate.formatedDate  else {
            return ""
        }
        return date.formatedString
    }
    var imageUrlStr:String {
        return article.urlToImage ?? ""
    }
    var sourceName: String{
        return article.source?.name ?? ""
    }
}


extension String {
    var formatedDate:Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.date(from: self)
    }
}

extension Date {
    var formatedString:String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy"
        return formatter.string(from: self)
    }
}
