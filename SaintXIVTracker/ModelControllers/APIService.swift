//
//  APIService.swift
//  Destiny2StatTracker
//
//  Created by Anthony Torres on 1/9/20.
//  Copyright © 2020 Anthony Torres. All rights reserved.
//

import UIKit

class APIService {
    
    var baseRawURL: String = "https://www.bungie.net/Platform"
    var baseImageRawURL: String = "https://www.bungie.net"
    var httpHeader: [String: String] = [
        "Accept": "application/json",
        "X-API-Key": "5ddd5269fe84443185ee11b0a51a97a2"
    ]
    
    static let shared = APIService()
    
    // MARK: Getting MemberID
    // + User info(in the future maybe...)
    func getMemberID(by name: String, and membershipType: Int, completion: @escaping(String?) ->Void) {
        guard let baseURL = URL(string: baseRawURL) else {
            completion(nil)
            return
        }
        
        let finalURL = baseURL.appendingPathComponent("Destiny2").appendingPathComponent("SearchDestinyPlayer").appendingPathComponent("\(membershipType)").appendingPathComponent(name)
        
        let config = URLSessionConfiguration.default
        config.httpShouldUsePipelining = true
        config.httpAdditionalHeaders = httpHeader
        let session = URLSession(configuration: config) // (If headers are involved, or the api requires a key)
        
        session.dataTask(with: finalURL) { (data, response, error) in
            if let error = error {
                print("MEMBER ID error with data", error)
                return completion(nil)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any]
                    
                    DispatchQueue.main.async {
                        if let response = json?["Response"] as? [Any] {
                            guard let user = response.first as? [String: Any],
                                !user.isEmpty
                                else {
                                    completion(nil)
                                    return
                            }
                            if let memberID = user["membershipId"] as? String {
                                completion(memberID)
                            }
                        }
                    }
                }
                catch let jsonError {
                    print("MEMBER ID json error", jsonError.localizedDescription)
                    completion(nil)
                }
            }
        }.resume()
    }
    
    // MARK: Getting Characters (gets your three characters)
    func getCharacters(by memberID: String, and membershipType: Int, completion: @escaping(_ characters:[(key: String, value: Any)]?) ->Void) {
        guard let baseURL = URL(string: baseRawURL) else {
            completion(nil)
            return
        }
        let secondURL = baseURL.appendingPathComponent("Destiny2").appendingPathComponent("\(membershipType)").appendingPathComponent("Profile").appendingPathComponent(memberID)
        
        guard var componets = URLComponents(url: secondURL, resolvingAgainstBaseURL: true) else { return }
        let componQ = URLQueryItem(name: "components", value: "200")
        componets.queryItems = [componQ]
        
        guard let url = componets.url else { return }
        let config = URLSessionConfiguration.default
        config.httpShouldUsePipelining = true
        config.httpAdditionalHeaders = httpHeader
        let session = URLSession(configuration: config)
        
        session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(nil)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any]
                    var charactersArr: [(key: String, value: Any)] = []
                    if let resp = json?["Response"] as? [String: Any] {
                        if let characters = resp["characters"] as? [String: Any] {
                            if let data = characters["data"] as? [String: Any] {
                                for character in data {
                                    // MARK: - Character ID
                                    charactersArr.append(character)
                                }
                                completion(charactersArr)
                            }
                        }
                    }
                }
                catch let jsonError {
                    print("GET CHARACTERS:", jsonError.localizedDescription)
                    completion(nil)
                }
            }
        }.resume()
    }
    
    func getPlayerAllTimeCrucibleStats(memberID: String, membershipType: Int, characterID: String, completion: @escaping(ApiResponse?) ->Void) {
        guard let baseURL = URL(string: baseRawURL) else {
            completion(nil)
            return
        }
        let secondURL = baseURL.appendingPathComponent("Destiny2").appendingPathComponent("\(membershipType)").appendingPathComponent("Account").appendingPathComponent(memberID).appendingPathComponent("Character").appendingPathComponent(characterID).appendingPathComponent("Stats")
        
        guard var componets = URLComponents(url: secondURL, resolvingAgainstBaseURL: true) else { return }
        
        let componQ = URLQueryItem(name: "modes", value: "5")
        componets.queryItems = [componQ]
        guard let url = componets.url else { return }
        
        let config = URLSessionConfiguration.default
        config.httpShouldUsePipelining = true
        config.httpAdditionalHeaders = httpHeader
        
        let session = URLSession(configuration: config)
        session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(nil)
            }
            if let data = data {
                do {
                    let apiResp = try JSONDecoder().decode(ApiResponse.self, from: data)
                    completion(apiResp)
                }
                catch let jsonError {
                    print("STATS:", jsonError.localizedDescription)
                    completion(nil)
                }
            }
        }.resume()
    }
    
    func getEmblem(with path: String, completion: @escaping(UIImage?) ->Void) {
        guard let baseURL = URL(string: baseImageRawURL) else {
            completion(nil)
            return
        }
        let finalURL = baseURL.appendingPathComponent(path)
        
        let config = URLSessionConfiguration.default
        config.httpShouldUsePipelining = true
        config.httpAdditionalHeaders = httpHeader
        let session = URLSession(configuration: config)
        
        session.dataTask(with: finalURL) { (data, response, error) in
            if error != nil {
                completion(nil)
            }
            if let data = data {
                guard let image = UIImage(data: data) else { return completion(nil) }
                completion(image)
            }
        }.resume()
    }
}
