//
//  NewsManager.swift
//  SenpiperAssignment
//
//  Created by rahul kaushik on 19/11/22.
//

import Foundation

struct Constants {
    static let weatherApiUrl = "https://newsapi.org/v2/top-headlines?country=in&apiKey=b3b53251c9db4155b46c09307970d3b8"
}

enum APIError : Error {
    case failedTogetData
}

class NewsManager {
    
    static let shared = NewsManager()
    
    func getNews(completion : @escaping (Result<[ArticleModel], Error>) -> Void) {
        guard let url = URL(string: Constants.weatherApiUrl) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(NewsData.self, from: data)
                completion(.success(results.articles))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
}
