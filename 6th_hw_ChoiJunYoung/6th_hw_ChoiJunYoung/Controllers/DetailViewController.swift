//
//  DetailViewController.swift
//  6th_hw_ChoiJunYoung
//
//  Created by Junyoung Choi on 11/1/24.
//

import UIKit

class DetailViewController: UIViewController {

    var user: User?  // 사용자 데이터 저장 프로퍼티

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        // Edit
        let editButton = UIButton(type: .system)
        editButton.setTitle("Edit", for: .normal)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editButton)

        // Delete
        let deleteButton = UIButton(type: .system)
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.setTitleColor(.red, for: .normal)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deleteButton)

        // PARD
        let pardLabel = UILabel()
        pardLabel.text = "PARD"
        pardLabel.font = UIFont.boldSystemFont(ofSize: 30)
        pardLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pardLabel)

        // Age
        let ageLabel = UILabel()
        ageLabel.text = "Age: \(user?.age ?? 0)"
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ageLabel)

        // Part
        let partLabel = UILabel()
        partLabel.text = "Part: \(user?.part ?? "")"
        partLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(partLabel)

        NSLayoutConstraint.activate([
            deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            deleteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            pardLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pardLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ageLabel.bottomAnchor.constraint(equalTo: partLabel.topAnchor, constant: -8),
            
            partLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            partLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
