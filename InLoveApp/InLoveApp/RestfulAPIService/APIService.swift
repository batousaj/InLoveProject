//
//  APIService.swift
//  InLoveApp
//
//  Created by Vu Thien on 05/12/2021.
//

import Foundation

class APIService {
    private var dataTask : URLSessionDataTask?
    
    func getData<T:Decodable>( url:String , response:T.Type,completion: @escaping (Result<T,Error>) -> Void ) {
        
        guard let URLtask = URL(string: url) else {
            print("Error to convert URL")
            return
        }
        
        URLSession.shared.dataTask(with: URLtask) { (data, response, error) in
            // Handle Error
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
                        
            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
                        
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            do {
                // Parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                
                // Back to the main thread
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                print("Error when decode JSON strings")
                completion(.failure(error))
            }
            
        }.resume()
        
    }
    
}
