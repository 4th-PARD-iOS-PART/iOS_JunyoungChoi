//
//  DownloadsViewController.swift
//  4th_hw_ChoiJunYoung
//
//  Created by Junyoung Choi on 10/4/24.
//

import UIKit

class DownloadsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        // Download 아이콘 생성
        let downloadIcon = UIImageView()
        downloadIcon.image = UIImage(named: "downloadPage_icon")
        downloadIcon.contentMode = .scaleAspectFit
        downloadIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(downloadIcon)

        // 텍스트 레이블
        let infoLabel = UILabel()
        infoLabel.text = "Movies and TV shows that you\ndownload appear here."
        infoLabel.numberOfLines = 0
        infoLabel.textColor = #colorLiteral(red: 0.650980413, green: 0.650980413, blue: 0.650980413, alpha: 1)
        infoLabel.font = UIFont.systemFont(ofSize: 20)
        infoLabel.textAlignment = .center
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoLabel)

        // Download 아이콘 오토 레이아웃
        NSLayoutConstraint.activate([
            downloadIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            downloadIcon.widthAnchor.constraint(equalToConstant: 200),
            downloadIcon.heightAnchor.constraint(equalToConstant: 200)
        ])

        // 텍스트 레이블 오토 레이아웃
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: downloadIcon.bottomAnchor, constant: 0),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        // 하단 버튼
        let downloadButton = UIButton()
        downloadButton.setTitle("Find Something to Download", for: .normal)
        downloadButton.setTitleColor(.black, for: .normal)
        downloadButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        downloadButton.backgroundColor = .white
        downloadButton.layer.cornerRadius = 8
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(downloadButton)

        // 하단 버튼 오토 레이아웃
        NSLayoutConstraint.activate([
            downloadButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 60),
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65),
            downloadButton.heightAnchor.constraint(equalToConstant: 40),
            downloadButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140)
        ])
    }
}
