//
//  APIService.swift
//  6th_hw_ChoiJunYoung
//
//  Created by Junyoung Choi on 10/31/24.
//

import Foundation

class APIService {
    private let baseURL = "http://ec2-13-209-3-68.ap-northeast-2.compute.amazonaws.com:8080"

    // POST
    func addNewUser(user: User, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "\(baseURL)/user") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(user)
        } catch {
            print("Encoding error: \(error)")
            completion(false)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            completion(true)
        }.resume()
    }
    
    // GET
    func getAllUsers(part: String, completion: @escaping ([User]) -> Void) {
        guard let url = URL(string: "\(baseURL)/user?part=\(part)") else {
            print("🚫 Invalid URL")
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion([])
                return
            }
            
            if let data = data {
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    completion(users)
                } catch {
                    print("Decoding error: \(error)")
                    completion([])
                }
            }
        }.resume()
    }
}

