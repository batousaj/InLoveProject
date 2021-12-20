//
//  YoutubeaPI.swift
//  APIDemoApp
//
//  Created by Vu Thien on 19/12/2021.
//

import Foundation

class YoutubeAPI {
    
    static func getData(url:String, completion:@escaping (Result<YoutubeResponse,Error>) -> Void) {
        
        guard let URLtask = URL(string: url) else {
            print("Error to convert URL")
            return
        }
        
        URLSession.shared.dataTask(with: URLtask) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
                        
            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                completion(.failure(error!))
                return
            }
            print("Response status code: \(response.statusCode)")
                        
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                completion(.failure(error!))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let JSONData = try decoder.decode(YoutubeResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(JSONData))
                }
            }
            catch {
                print("Error when decode JSON strings")
                completion(.failure(error))
            }
            
            
        }.resume()
    }
}
