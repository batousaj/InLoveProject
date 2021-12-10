//
//  Model.swift
//  InLoveApp
//
//  Created by Vu Thien on 05/12/2021.
//


import Foundation


struct Response: Decodable {
    
    let moviesInfo: [MoviewModel]
    
    private enum CodingKeys: String, CodingKey {
        case moviesInfo = "results"
    }
}

struct MoviewModel: Codable {
    
    let title: String?
    let releaseDate: String?
    let rate: Double?
    let posterImage: String?
    let overview: String?
    
    private enum CodingKeys: String, CodingKey {
        case title, overview
        case releaseDate = "release_date"
        case rate = "vote_average"
        case posterImage = "poster_path"
    }
}


//Json parse
//{
//    "adult":false,
//    "backdrop_path":"/lNyLSOKMMeUPr1RsL4KcRuIXwHt.jpg",
//    "genre_ids":[
//    878,
//    28,
//    12
//    ],
//    "id":580489,
//    "original_language":"en",
//    "original_title":"Venom: Let There Be Carnage",
//    "overview":"After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.",
//    "popularity":10424.41,
//    "poster_path":"/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg",
//    "release_date":"2021-09-30",
//    "title":"Venom: Let There Be Carnage",
//    "video":false,
//    "vote_average":7.2,
//    "vote_count":4087
//},
