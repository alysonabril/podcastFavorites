//
//  APIClient.swift
//  podcastFavorites
//
//  Created by Pursuit on 9/18/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

class APIClient {
    
    private init() {}
    
    static let shared = APIClient()
    
    func getPodcasts(searchWord: String, completionHandler: @escaping (Result<[Results], AppError>) -> Void) {
        let urlStr = "https://itunes.apple.com/search?media=podcast&limit=200&term=\(searchWord)"
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error) :
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let podcastInfo = try JSONDecoder().decode(PodcastSearch.self, from: data)
                    completionHandler(.success(podcastInfo.results))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}
