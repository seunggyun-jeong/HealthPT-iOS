//
//  NetworkManager.swift
//  HealthPT-iOS
//
//  Created by 정승균 on 2023/05/31.
//

import Foundation

class NetworkManager {
    static let serverAddress: String = "https://1ef3-218-149-226-174.ngrok-free.app"
    static let successRange = 200..<300

    // 체육관 리스트 불러오기
    static func loadKeywordSearch(api: String, completion: @escaping ([Gym]) -> Void) {
        let session = URLSession(configuration: .default)

        guard let upLoadData = try? JSONEncoder().encode(KeywordSearchBodyData()) else { return }
        
        print("진입")
        do {
            let requestURL = try makePostRequest(api: api, data: upLoadData, ip: serverAddress)
            
            let dataTask = session.dataTask(with: requestURL) { data, response, error in
                guard error == nil,
                      let statusCode = (response as? HTTPURLResponse)?.statusCode,
                      successRange.contains(statusCode)
                else {
                    print((response as? HTTPURLResponse)?.statusCode)
                    return
                }
                
                print("statusCode ===> \(statusCode)")
                
                guard let resultData = data else {
                    return
                }
                
                let gym = parseGymData(data: resultData)
                
                completion(gym)
            }
            
            dataTask.resume()
        } catch {
            print(error)
        }
    }
    
    static func parseGymData(data: Data) -> [Gym] {
        let decoder = JSONDecoder()

        do {
            let response = try decoder.decode([Gym].self, from: data)
            return response
        } catch let error {
            print("parsing error : \(error)")
            return []
        }
    }
    
    // 트레이너 리스트 불러오기
    static func loadTrainerList(gymId: Int, completion: @escaping ([Trainer]) -> Void) {
        let session = URLSession(configuration: .default)
        
        print("진입")
        do {
            let requestURL = try makePostRequest(api: "/api/trainer/" + String(gymId), ip: serverAddress)
            
            let dataTask = session.dataTask(with: requestURL) { data, response, error in
                guard error == nil,
                      let statusCode = (response as? HTTPURLResponse)?.statusCode,
                      successRange.contains(statusCode)
                else {
                    print((response as? HTTPURLResponse)?.statusCode)
                    return
                }
                
                print("statusCode ===> \(statusCode)")
                
                guard let resultData = data else {
                    return
                }
                
                let trainers = parseTrainerData(data: resultData)
                
                completion(trainers)
            }
            
            dataTask.resume()
        } catch {
            print(error)
        }
    }
    
    static func parseTrainerData(data: Data) -> [Trainer] {
        let decoder = JSONDecoder()

        do {
            let response = try decoder.decode([Trainer].self, from: data)
            return response
        } catch let error {
            print("parsing error : \(error)")
            return []
        }
    }

    
    static func makePostRequest(api: String, data: Data = Data(), ip: String) throws -> URLRequest {
        guard let url = URL(string: ip + api) else {
            throw URLError(.badURL)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = data
        
        return urlRequest
    }
}

struct KeywordSearchBodyData: Codable {
    var gymInfo = ""
}
