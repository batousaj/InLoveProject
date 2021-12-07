//
//  APIService.swift
//  InLoveApp
//
//  Created by Vu Thien on 05/12/2021.
//

import Foundation

class APIService {
    private var dataTask : URLSessionDataTask?
    
    func getData( url:String , completion: @escaping (Result<Response,Error>) -> Void ) {
        
        guard let URLtask = URL(string: url) else {
            print("Error to convert URL")
            return
        }
        
        URLSession.shared.dataTask(with: URLtask) { (data, response, error) in
            if error != nil {
                print("Error when send request URL")
                completion(.failure(error!))
                return
            }
            
            guard (response as? HTTPURLResponse) != nil else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            do {
                let movies = try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(movies))
                }
            }
            catch {
                print("Error when decode JSON strings")
                completion(.failure(error))
                return
            }
            
            
        }.resume()
        
    }
    
}
