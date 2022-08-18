//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by Jean Ricardo Cesca on 17/08/22.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}



