//
//  SearchViewController.swift
//  5th_hw_ChoiJunYoung
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
        
        // 영화 정보 추가
        let movies = [("downMovie_1", "Citation"),
                      ("downMovie_2", "Oloture"),
                      ("downMovie_3", "The Setup"),
                      ("downMovie_4", "Breaking Bad"),
                      ("downMovie_5", "Ozark"),
                      ("downMovie_6", "The Governor"),
                      ("downMovie_7", "Your Excellency")]
        
        // 각 영화에 대한 뷰 생성
        var previousView: UIView? // 이전 뷰를 추적하기 위한 변수
        
        for (index, movie) in movies.enumerated() {
            let movieView = createMovieView(imageName: movie.0, title: movie.1)
            contentView.addSubview(movieView)
            
            // 영화 뷰에 탭 제스처 추가 (탭하면 InfoViewController로 이동)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(movieTapped(_:)))
            movieView.tag = index // 각 영화 뷰에 고유 태그 지정
            movieView.addGestureRecognizer(tapGesture)
            movieView.isUserInteractionEnabled = true
            
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
                movieView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
            }
            
            previousView = movieView
        }
    }
    
    @objc private func movieTapped(_ sender: UITapGestureRecognizer) {
        guard let movieView = sender.view else { return }
        let movies = [("downMovie_1", "Citation"),
                      ("downMovie_2", "Oloture"),
                      ("downMovie_3", "The Setup"),
                      ("downMovie_4", "Breaking Bad"),
                      ("downMovie_5", "Ozark"),
                      ("downMovie_6", "The Governor"),
                      ("downMovie_7", "Your Excellency")]

        let selectedMovie = movies[movieView.tag]
        let infoVC = InfoViewController(imageName: selectedMovie.0, title: selectedMovie.1)

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = infoVC
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
        
        // 오른쪽 아이콘 생성 (white_ring_icon)
        let whiteRingIcon = UIImageView()
        whiteRingIcon.image = UIImage(named: "white_ring_icon")
        whiteRingIcon.contentMode = .scaleAspectFit
        whiteRingIcon.translatesAutoresizingMaskIntoConstraints = false
        movieView.addSubview(whiteRingIcon)
        
        // 오른쪽 아이콘 생성 (white_vector_icon)
        let whiteVectorIcon = UIImageView()
        whiteVectorIcon.image = UIImage(named: "white_vector_icon")
        whiteVectorIcon.contentMode = .scaleAspectFit
        whiteVectorIcon.translatesAutoresizingMaskIntoConstraints = false
        movieView.addSubview(whiteVectorIcon)
        
        // 오토 레이아웃 설정
        NSLayoutConstraint.activate([
            // 영화 이미지 설정
            imageView.leadingAnchor.constraint(equalTo: movieView.leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: movieView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            // 영화 제목 설정
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: movieView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: movieView.trailingAnchor, constant: -50), // 오른쪽 여백
            
            // 오른쪽 링 아이콘 설정
            whiteRingIcon.trailingAnchor.constraint(equalTo: movieView.trailingAnchor, constant: -10),
            whiteRingIcon.centerYAnchor.constraint(equalTo: movieView.centerYAnchor),
            whiteRingIcon.widthAnchor.constraint(equalToConstant: 30),
            whiteRingIcon.heightAnchor.constraint(equalToConstant: 30),
            
            // 오른쪽 벡터 아이콘 설정 (링 내부에 배치)
            whiteVectorIcon.centerXAnchor.constraint(equalTo: whiteRingIcon.centerXAnchor, constant: 2),
            whiteVectorIcon.centerYAnchor.constraint(equalTo: whiteRingIcon.centerYAnchor),
            whiteVectorIcon.widthAnchor.constraint(equalToConstant: 17),
            whiteVectorIcon.heightAnchor.constraint(equalToConstant: 17)
        ])
        
        return movieView
    }
}
