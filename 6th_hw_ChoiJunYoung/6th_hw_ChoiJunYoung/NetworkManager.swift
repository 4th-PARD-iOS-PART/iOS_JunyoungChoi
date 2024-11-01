//
//  NetworkManager.swift
//  6th_hw_ChoiJunYoung
//
//  Created by Junyoung Choi on 10/31/24.
//

import Foundation

class NetworkManager {
    private let apiService = APIService()
    private(set) var users: [User] = []

    // 서버에서 사용자 목록을 가져와 users 배열 업데이트, 완료 시 테이블 뷰를 갱신할 수 있도록 completion 핸들러 호출
    func fetchUsers(completion: @escaping () -> Void) {
        apiService.getAllUsers(part: "all") { [weak self] fetchedUsers in
            self?.users = fetchedUsers
            completion()
        }
    }

    // 새로운 사용자를 추가하고 성공 시 users 배열에 추가한 후, completion 핸들러 호출
    func addUser(name: String, age: Int, part: String, completion: @escaping (Bool) -> Void) {
        let newUser = User(id: nil, name: name, part: part, age: age)
        apiService.addNewUser(user: newUser) { [weak self] success in
            if success {
                self?.users.append(newUser)
            }
            completion(success)
        }
    }
}
