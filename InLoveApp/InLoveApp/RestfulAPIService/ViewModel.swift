//
//  ViewModel.swift
//  InLoveApp
//
//  Created by Vu Thien on 05/12/2021.
//

import Foundation
import CoreMedia

let URLstring = "https://api.themoviedb.org/3/movie/popular?api_key=4e0be2c22f7268edffde97481d49064a&language=en-US&page=1"

let NO_ERROR_CODE = 0
let HAS_ERROR_CODE = -1

class MovieViewModel {
        
    var Service:APIService!
    
    private var movies = [MoviewModel]()

    func initService() {
        Service = APIService()
    }
    
    func fetchMoviesData(completion: @escaping (Int) -> Void) {
        Service.getData(url: URLstring) { [weak self] (result) in
            switch result {
                case .success(let response) :
                    self?.movies = response.moviesInfo
                    completion(NO_ERROR_CODE)
                    break
                
                case .failure(let error) :
                    print("Can not request data with Code : \(error)")
                    completion(HAS_ERROR_CODE)
                    break
            }
        }
    }
    
    func getNumberOfRow() -> Int {
        return self.movies.count
    }
    
    func getMoviesInfoWith(index :IndexPath) -> MoviewModel {
        return self.movies[index.row]
    }
}
