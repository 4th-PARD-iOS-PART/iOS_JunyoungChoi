//
//  SearchViewController.swift
//  4th_hw_ChoiJunYoung
//
//  Created by Junyoung Choi on 10/4/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        // ScrollView 생성
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = .black
        scrollView.contentInsetAdjustmentBehavior = .always
        view.addSubview(scrollView)

        // Search Bar 생성
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for a show, movie, genre, etc."
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(searchBar)

        // Search Bar 오토 레이아웃 설정
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: scrollView.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])

        // 음성 검색 버튼 생성
        let voiceSearchButton = UIButton(type: .custom)
        if let voiceImage = UIImage(named: "voice_icon")?.withRenderingMode(.alwaysTemplate) {
            voiceSearchButton.setImage(voiceImage, for: .normal)
            voiceSearchButton.tintColor = #colorLiteral(red: 0.1633507311, green: 0.1626823545, blue: 0.1780656874, alpha: 1)
        }
        voiceSearchButton.translatesAutoresizingMaskIntoConstraints = false

        // 음성 검색 버튼을 Search Bar의 오른쪽에 추가
        searchBar.addSubview(voiceSearchButton)

        // 음성 검색 버튼 오토 레이아웃 설정
        NSLayoutConstraint.activate([
            voiceSearchButton.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: -8),
            voiceSearchButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            voiceSearchButton.widthAnchor.constraint(equalToConstant: 30),
            voiceSearchButton.heightAnchor.constraint(equalToConstant: 30)
        ])

        // ContentView 설정
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        // ContentView 오토 레이아웃 설정
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        // 스크롤 가능한 콘텐츠 추가
        let contentHeight: CGFloat = 700
        contentView.heightAnchor.constraint(equalToConstant: contentHeight).isActive = true

        // 예시 콘텐츠 추가 (레이블)
        let exampleLabel = UILabel()
        exampleLabel.text = "Top Searches"
        exampleLabel.textColor = .white
        exampleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        exampleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(exampleLabel)

        // 예시 레이블 오토 레이아웃 설정
        NSLayoutConstraint.activate([
            exampleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            exampleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        // 영화 정보 추가
        let movies = [("downMovie_1", "Citation"),
                      ("downMovie_2", "Oloture"),
                      ("downMovie_3", "The Setup"),
                      ("downMovie_4", "Breaking Bad"),
                      ("downMovie_5", "Ozark"),
                      ("downMovie_6", "The Governor"),
                      ("downMovie_7", "Your Excellency"),
]

        // 각 영화에 대한 뷰 생성
        var previousView: UIView? // 이전 뷰를 추적하기 위한 변수
        
        for (_, movie) in movies.enumerated() {
            let movieView = createMovieView(imageName: movie.0, title: movie.1)
            contentView.addSubview(movieView)

            // 오토 레이아웃 설정
            NSLayoutConstraint.activate([
                movieView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                movieView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                movieView.heightAnchor.constraint(equalToConstant: 80)
            ])

            // movieView의 y 위치 설정
            if let previous = previousView {
                movieView.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 4).isActive = true
            } else {
                movieView.topAnchor.constraint(equalTo: exampleLabel.bottomAnchor, constant: 20).isActive = true
            }

            previousView = movieView // 현재 movieView를 이전 뷰로 설정
        }
    }
    
    private func createMovieView(imageName: String, title: String) -> UIView {
        let movieView = UIView()
        movieView.translatesAutoresizingMaskIntoConstraints = false
        movieView.backgroundColor = #colorLiteral(red: 0.2588235736, green: 0.2588235736, blue: 0.2588235736, alpha: 1)

        // 이미지 생성
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        movieView.addSubview(imageView)

        // 제목 레이블 생성
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieView.addSubview(titleLabel)

        // 오른쪽 아이콘 생성
        let whiteRingIcon = UIImageView()
        whiteRingIcon.image = UIImage(named: "white_ring_icon")
        whiteRingIcon.contentMode = .scaleAspectFit
        whiteRingIcon.translatesAutoresizingMaskIntoConstraints = false
        movieView.addSubview(whiteRingIcon)

        let whiteVectorIcon = UIImageView()
        whiteVectorIcon.image = UIImage(named: "white_vector_icon")
        whiteVectorIcon.contentMode = .scaleAspectFit
        whiteVectorIcon.translatesAutoresizingMaskIntoConstraints = false
        movieView.addSubview(whiteVectorIcon)

        // 오토 레이아웃 설정
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: movieView.leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: movieView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 80),

            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: movieView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: movieView.trailingAnchor, constant: -50),

            // 오른쪽 아이콘의 오토 레이아웃 설정
            whiteRingIcon.trailingAnchor.constraint(equalTo: movieView.trailingAnchor, constant: -10),
            whiteRingIcon.centerYAnchor.constraint(equalTo: movieView.centerYAnchor),
            whiteRingIcon.widthAnchor.constraint(equalToConstant: 30),
            whiteRingIcon.heightAnchor.constraint(equalToConstant: 30),

            whiteVectorIcon.centerXAnchor.constraint(equalTo: whiteRingIcon.centerXAnchor, constant: 2),
            whiteVectorIcon.centerYAnchor.constraint(equalTo: whiteRingIcon.centerYAnchor),
            whiteVectorIcon.widthAnchor.constraint(equalToConstant: 17),
            whiteVectorIcon.heightAnchor.constraint(equalToConstant: 17)
        ])

        return movieView
    }
}
