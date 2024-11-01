//
//  ModalViewController.swift
//  6th_hw_ChoiJunYoung
//
//  Created by Junyoung Choi on 10/31/24.
//

import UIKit

protocol ModalViewControllerDelegate: AnyObject {
    func didAddUser(name: String, age: Int, part: String)
}

class ModalViewController: UIViewController {

    weak var delegate: ModalViewControllerDelegate?

    private let nameTextField = UITextField()
    private let ageTextField = UITextField()
    private let partTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupModalUI()
    }

    private func setupModalUI() {
        view.backgroundColor = .white

        nameTextField.placeholder = "이름을 입력해주세요"
        nameTextField.borderStyle = .roundedRect

        ageTextField.placeholder = "나이를 입력해주세요"
        ageTextField.borderStyle = .roundedRect

        partTextField.placeholder = "파트를 입력해주세요"
        partTextField.borderStyle = .roundedRect

        let stackView = UIStackView(arrangedSubviews: [nameTextField, ageTextField, partTextField])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let addButton = UIButton(type: .system)
        addButton.setTitle("추가하기", for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)
        view.addSubview(addButton)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func addButtonTapped() {
        guard let name = nameTextField.text, !name.isEmpty,
              let ageText = ageTextField.text, let age = Int(ageText),
              let part = partTextField.text, !part.isEmpty else {
            return
        }

        delegate?.didAddUser(name: name, age: age, part: part)
        dismiss(animated: true, completion: nil)
    }
}
