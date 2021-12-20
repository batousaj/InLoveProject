//
//  YoutubeModel.swift
//  APIDemoApp
//
//  Created by Vu Thien on 19/12/2021.
//

import Foundation

struct SessionAPI {
    
    static var API_KEY = "AIzaSyAov5R0yYKtNxyGZ480bjXOdyL9tZpsK0w"
    static var PLAYLIST_ID = "RDnpkTUosmU3o"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlists?part=snippet&id=\(SessionAPI.PLAYLIST_ID)&key=\(SessionAPI.API_KEY)"
    static var VIDEO_WATCH = "https://www.youtube.com/watch?v="
//    static var VIDEO_WATCH = "https://www.youtube.com/embed/"
}
    

struct YoutubeResponse: Decodable {
    var items:[YoutubeModel]?
    
    enum CodingKeys : String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([YoutubeModel].self, forKey: .items)
        //
    }
}

struct YoutubeModel : Decodable {
    
//    var videoID = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = ""
    
    
    enum CodingKeys : String, CodingKey {
        case snippet
        case thumbnails
        case high
//        case resourceID
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
//        case videoID
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.published = try snippetContainer.decode(String.self, forKey: .published)
        print("\(title) v \(description) v \(published)")
        
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy:CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
//        let resourceContainer = try container.nestedContainer(keyedBy:CodingKeys.self, forKey: .resourceID)
        
//        self.videoID = try resourceContainer.decode(String.self, forKey: .resourceId)
        
//        print("\(thumbnail) v \(videoID)")
        
    }
}
