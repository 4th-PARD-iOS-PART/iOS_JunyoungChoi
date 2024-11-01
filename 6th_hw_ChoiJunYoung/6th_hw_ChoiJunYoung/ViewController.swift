//
//  ViewController.swift
//  6th_hw_ChoiJunYoung
//
//  Created by Junyoung Choi on 10/31/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let networkManager = NetworkManager()
    private var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }

    private func setupUI() {
        view.backgroundColor = .white

        let titleLabel = UILabel()
        titleLabel.text = "UrlSession"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let addButton = UIButton(type: .system)
        addButton.setTitle("추가", for: .normal)
        addButton.addTarget(self, action: #selector(presentModal), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false

        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        view.addSubview(titleLabel)
        view.addSubview(addButton)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    @objc private func presentModal() {
        let modalVC = ModalViewController()
        modalVC.modalPresentationStyle = .pageSheet
        modalVC.delegate = self
        present(modalVC, animated: true, completion: nil)
    }

    private func fetchData() {
        networkManager.fetchUsers {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return networkManager.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        let user = networkManager.users[indexPath.row]
        cell.textLabel?.text = "[\(user.part)] \(user.name)"
        return cell
    }

    // 셀 선택 시 DetailViewController를 모달로 표시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = networkManager.users[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.user = user  // 사용자 데이터 전달
        detailVC.modalPresentationStyle = .pageSheet
        present(detailVC, animated: true, completion: nil)
    }
}

extension ViewController: ModalViewControllerDelegate {
    func didAddUser(name: String, age: Int, part: String) {
        networkManager.addUser(name: name, age: age, part: part) { success in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
