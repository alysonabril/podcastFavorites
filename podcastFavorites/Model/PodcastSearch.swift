//
//  PodcastSearch.swift
//  podcastFavorites
//
//  Created by Pursuit on 9/18/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct PodcastSearch: Codable {
    let results: [Results]
    
    
}

struct Results: Codable {
    let artistName: String
    let trackName: String
    let releaseDate: String
    let primaryGenreName: String
    let genres: [String]
}


