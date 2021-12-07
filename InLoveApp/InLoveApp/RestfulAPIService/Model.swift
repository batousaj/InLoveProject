//
//  Model.swift
//  InLoveApp
//
//  Created by Vu Thien on 05/12/2021.
//


import Foundation


struct Response:Decodable {
    let moviesInfo : [MoviewModel]
    let status:String
    
}

struct MoviewModel:Decodable {
    let title:String? //title
    let releaseDate:String? //release_date
    let overview:String? //overview
    let posterImage:String? //poster_path
    let rate:String? //vote_average
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
