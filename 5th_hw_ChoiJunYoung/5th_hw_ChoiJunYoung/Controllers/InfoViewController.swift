//
//  InfoViewController.swift
//  5th_hw_ChoiJunYoung
//
//  Created by Junyoung Choi on 10/22/24.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let imageName: String
    private let movieTitle: String
    
    // 초기화 메서드
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.movieTitle = title
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // ScrollView 생성
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        // ContentView 생성 (ScrollView 안에 들어갈 내용들을 담는 컨테이너)
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        // 영화 이미지 생성
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        // 타이틀 이미지 위에 겹쳐서 추가할 play-large.png 이미지 생성
        let playLargeImageView = UIImageView(image: UIImage(named: "play-large.png"))
        playLargeImageView.contentMode = .scaleAspectFit
        playLargeImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(playLargeImageView)
        
        // control.png 버튼 생성
        let controlButton = UIButton(type: .custom)
        controlButton.setImage(UIImage(named: "control.png"), for: .normal)
        controlButton.translatesAutoresizingMaskIntoConstraints = false
        
        // close.png 버튼 생성
        let closeButton = UIButton(type: .custom)
        closeButton.setImage(UIImage(named: "close.png"), for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView 생성하여 버튼 추가
        let buttonStack = UIStackView(arrangedSubviews: [controlButton, closeButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 10
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(buttonStack)
        
        // StackView 오토레이아웃 설정
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            buttonStack.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10)
        ])
        
        // 영화 제목 레이블 생성
        let titleLabel = UILabel()
        titleLabel.text = movieTitle
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        // Icon StackView 생성
        let icon1 = UIImageView(image: UIImage(named: "netflix_icon.png"))
        icon1.contentMode = .scaleAspectFit
        icon1.translatesAutoresizingMaskIntoConstraints = false
        
        let icon2 = UIImageView(image: UIImage(named: "series.png"))
        icon2.contentMode = .scaleAspectFit
        icon2.translatesAutoresizingMaskIntoConstraints = false
        
        // Icon StackView 생성
        let iconStackView = UIStackView(arrangedSubviews: [icon1, icon2])
        iconStackView.axis = .horizontal
        iconStackView.spacing = 10
        iconStackView.alignment = .center
        iconStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconStackView)
        
        // 텍스트와 아이콘 스택뷰 생성
        let yearLabel = UILabel()
        yearLabel.text = "2022"
        yearLabel.textColor = .white
        yearLabel.font = UIFont.systemFont(ofSize: 20)
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let seasonsLabel = UILabel()
        seasonsLabel.text = "5 Seasons"
        seasonsLabel.textColor = .white
        seasonsLabel.font = UIFont.systemFont(ofSize: 20)
        seasonsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let tvmaIcon = UIImageView(image: UIImage(named: "TVMA.png"))
        tvmaIcon.contentMode = .scaleAspectFit
        tvmaIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let visionIcon = UIImageView(image: UIImage(named: "vision.png"))
        visionIcon.contentMode = .scaleAspectFit
        visionIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let hdIcon = UIImageView(image: UIImage(named: "HD.png"))
        hdIcon.contentMode = .scaleAspectFit
        hdIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let adIcon = UIImageView(image: UIImage(named: "AD.png"))
        adIcon.contentMode = .scaleAspectFit
        adIcon.translatesAutoresizingMaskIntoConstraints = false
        
        // 스택뷰에 추가
        let infoStackView = UIStackView(arrangedSubviews: [yearLabel, tvmaIcon, seasonsLabel, visionIcon, hdIcon, adIcon])
        infoStackView.axis = .horizontal
        infoStackView.spacing = 5
        infoStackView.alignment = .center
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(infoStackView)
        
        // Play Button 생성
        let playButton = UIButton(type: .system)
        playButton.backgroundColor = .white
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.layer.cornerRadius = 5
        contentView.addSubview(playButton)
        
        // Play Button 내부 StackView 생성 (아이콘과 텍스트 추가)
        let playIcon = UIImageView(image: UIImage(named: "infoPlay.png"))
        playIcon.contentMode = .scaleAspectFit
        playIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let playLabel = UILabel()
        playLabel.text = "Play"
        playLabel.textColor = .black
        playLabel.font = UIFont.systemFont(ofSize: 20)
        playLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let playStackView = UIStackView(arrangedSubviews: [playIcon, playLabel])
        playStackView.axis = .horizontal
        playStackView.spacing = 5
        playStackView.alignment = .center
        playStackView.translatesAutoresizingMaskIntoConstraints = false
        playButton.addSubview(playStackView)
        
        // Download Button 생성
        let downloadButton = UIButton(type: .system)
        downloadButton.backgroundColor = #colorLiteral(red: 0.1607843339, green: 0.1607843339, blue: 0.1607843339, alpha: 1)
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.layer.cornerRadius = 5
        contentView.addSubview(downloadButton)
        
        // Download Button 내부 StackView 생성 (아이콘과 텍스트 추가)
        let downloadIcon = UIImageView(image: UIImage(named: "infoDownload.png"))
        downloadIcon.contentMode = .scaleAspectFit
        downloadIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let downloadLabel = UILabel()
        downloadLabel.text = "Download"
        downloadLabel.textColor = #colorLiteral(red: 0.4509803653, green: 0.4509803057, blue: 0.4509803057, alpha: 1)
        downloadLabel.font = UIFont.systemFont(ofSize: 20)
        downloadLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let downloadStackView = UIStackView(arrangedSubviews: [downloadIcon, downloadLabel])
        downloadStackView.axis = .horizontal
        downloadStackView.spacing = 5
        downloadStackView.alignment = .center
        downloadStackView.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.addSubview(downloadStackView)
        
        // 에피소드 제목 텍스트 (Bold 처리)
        let episodeTitleLabel = UILabel()
        episodeTitleLabel.text = "S5:E10 Nothing Remains The Same"
        episodeTitleLabel.textColor = .white
        episodeTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        episodeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(episodeTitleLabel)
        
        // 에피소드 설명 텍스트 (일반 폰트)
        let episodeDescriptionLabel = UILabel()
        episodeDescriptionLabel.text = """
        Hearts flip as Heather weds Tarek. Jason and Mary grapple with being ghosted. \
        Go solo or take the next step: The agents face life-changing decisions.
        """
        episodeDescriptionLabel.textColor = .lightGray
        episodeDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        episodeDescriptionLabel.numberOfLines = 0
        episodeDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(episodeDescriptionLabel)
        
        // 아이콘 + 텍스트 세로 정렬된 StackView 생성
        let myListIcon = UIImageView(image: UIImage(named: "myList_icon.png"))
        myListIcon.contentMode = .scaleAspectFit
        myListIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let myListLabel = UILabel()
        myListLabel.text = "My List"
        myListLabel.textColor = .white
        myListLabel.font = UIFont.systemFont(ofSize: 14)
        myListLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let myListStackView = UIStackView(arrangedSubviews: [myListIcon, myListLabel])
        myListStackView.axis = .vertical
        myListStackView.alignment = .center
        myListStackView.spacing = 5
        myListStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let rateIcon = UIImageView(image: UIImage(named: "rate.png"))
        rateIcon.contentMode = .scaleAspectFit
        rateIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let rateLabel = UILabel()
        rateLabel.text = "Rate"
        rateLabel.textColor = .white
        rateLabel.font = UIFont.systemFont(ofSize: 14)
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let rateStackView = UIStackView(arrangedSubviews: [rateIcon, rateLabel])
        rateStackView.axis = .vertical
        rateStackView.alignment = .center
        rateStackView.spacing = 5
        rateStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let shareIcon = UIImageView(image: UIImage(named: "share.png"))
        shareIcon.contentMode = .scaleAspectFit
        shareIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let shareLabel = UILabel()
        shareLabel.text = "Share"
        shareLabel.textColor = .white
        shareLabel.font = UIFont.systemFont(ofSize: 14)
        shareLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let shareStackView = UIStackView(arrangedSubviews: [shareIcon, shareLabel])
        shareStackView.axis = .vertical
        shareStackView.alignment = .center
        shareStackView.spacing = 5
        shareStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView에 세 개의 StackView 추가
        let iconActionStackView = UIStackView(arrangedSubviews: [myListStackView, rateStackView, shareStackView])
        iconActionStackView.axis = .horizontal
        iconActionStackView.spacing = 80
        iconActionStackView.alignment = .leading
        iconActionStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconActionStackView)
        
        // Bar 아이콘 추가
        let barIcon = UIImageView(image: UIImage(named: "bar.png"))
        barIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(barIcon)
        
        // Bold 텍스트 4개 생성
        let episodesLabel = UILabel()
        episodesLabel.text = "Episodes"
        episodesLabel.textColor = .white
        episodesLabel.font = UIFont.boldSystemFont(ofSize: 14)
        episodesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let collectionLabel = UILabel()
        collectionLabel.text = "Collection"
        collectionLabel.textColor = .gray
        collectionLabel.font = UIFont.boldSystemFont(ofSize: 14)
        collectionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let moreLikeThisLabel = UILabel()
        moreLikeThisLabel.text = "More Like This"
        moreLikeThisLabel.textColor = .gray
        moreLikeThisLabel.font = UIFont.boldSystemFont(ofSize: 14)
        moreLikeThisLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let trailersLabel = UILabel()
        trailersLabel.text = "Trailers & More"
        trailersLabel.textColor = .gray
        trailersLabel.font = UIFont.boldSystemFont(ofSize: 14)
        trailersLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView로 텍스트들을 추가
        let textStackView = UIStackView(arrangedSubviews: [episodesLabel, collectionLabel, moreLikeThisLabel, trailersLabel])
        textStackView.axis = .horizontal
        textStackView.alignment = .leading
        textStackView.spacing = 20
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textStackView)
        
        // "Season 5" 텍스트와 dropDown 아이콘을 추가하는 StackView 생성
        let seasonLabel = UILabel()
        seasonLabel.text = "Season 5"
        seasonLabel.textColor = .white
        seasonLabel.font = UIFont.boldSystemFont(ofSize: 14)
        seasonLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let dropDownIcon = UIImageView(image: UIImage(named: "dropDown"))
        dropDownIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let seasonStackView = UIStackView(arrangedSubviews: [seasonLabel, dropDownIcon])
        seasonStackView.axis = .horizontal
        seasonStackView.spacing = 10 // 텍스트와 아이콘 사이의 간격
        seasonStackView.alignment = .center
        seasonStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(seasonStackView)
        
        // 타이틀 이미지와 동일한 이미지를 추가 (imageView 복사)
        let additionalImageView = UIImageView(image: UIImage(named: imageName))
        additionalImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(additionalImageView)
        
        // "Game Changer"와 "37m" 텍스트를 포함하는 Vertical StackView 생성
        let titleTextLabel = UILabel()
        titleTextLabel.text = "Game Changer"
        titleTextLabel.textColor = .white
        titleTextLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let durationLabel = UILabel()
        durationLabel.text = "37m"
        durationLabel.textColor = .gray
        durationLabel.font = UIFont.systemFont(ofSize: 14)
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let episodeTextStackView = UIStackView(arrangedSubviews: [titleTextLabel, durationLabel])
        episodeTextStackView.axis = .vertical
        episodeTextStackView.alignment = .leading
        episodeTextStackView.spacing = 5
        episodeTextStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // additionalImageView와 textStackView를 포함하는 Horizontal StackView 생성
        let combinedStackView = UIStackView(arrangedSubviews: [additionalImageView, episodeTextStackView])
        combinedStackView.axis = .horizontal
        combinedStackView.spacing = 10
        combinedStackView.alignment = .center
        combinedStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(combinedStackView)
        
        let additionalPlayLargeImageView = UIImageView(image: UIImage(named: "playButton.png"))
        additionalPlayLargeImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(additionalPlayLargeImageView)
        
        // 새로운 텍스트 레이블 생성
        let descriptionLabel = UILabel()
        descriptionLabel.text = """
        Flying high: Chrishell reveals her latest love - Jason. In LA, the agents get real about the relationship while Christine readies her return.
        """
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        
        // ScrollView 오토레이아웃 설정
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // ContentView 오토레이아웃 설정 (ScrollView 안에서)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        // 이미지 오토레이아웃 설정
        if let image = UIImage(named: imageName) {
            let aspectRatio = image.size.height / image.size.width
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 55),
                imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: aspectRatio)
            ])
        }
        
        // 타이틀 이미지 위에 play-large.png를 겹치게 추가
        NSLayoutConstraint.activate([
            playLargeImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            playLargeImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            playLargeImageView.widthAnchor.constraint(equalToConstant: 80),
            playLargeImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        // Icon StackView 오토레이아웃 설정
        NSLayoutConstraint.activate([
            iconStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            iconStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        // 제목 레이블 오토레이아웃 설정
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: iconStackView.bottomAnchor, constant: -5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        // Info StackView 오토레이아웃 설정
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            infoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            infoStackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -10)
        ])
        
        // Play Button 오토레이아웃 설정
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 20),
            playButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            playButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Play Button 내부 StackView 오토레이아웃 설정
        NSLayoutConstraint.activate([
            playStackView.centerXAnchor.constraint(equalTo: playButton.centerXAnchor),
            playStackView.centerYAnchor.constraint(equalTo: playButton.centerYAnchor)
        ])
        
        // Download Button 오토레이아웃 설정
        NSLayoutConstraint.activate([
            downloadButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 10),
            downloadButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            downloadButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            downloadButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Download Button 내부 StackView 오토레이아웃 설정
        NSLayoutConstraint.activate([
            downloadStackView.centerXAnchor.constraint(equalTo: downloadButton.centerXAnchor),
            downloadStackView.centerYAnchor.constraint(equalTo: downloadButton.centerYAnchor)
        ])
        
        // 에피소드 제목 오토레이아웃 설정
        NSLayoutConstraint.activate([
            episodeTitleLabel.topAnchor.constraint(equalTo: downloadButton.bottomAnchor, constant: 20),
            episodeTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            episodeTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        // 에피소드 설명 오토레이아웃 설정
        NSLayoutConstraint.activate([
            episodeDescriptionLabel.topAnchor.constraint(equalTo: episodeTitleLabel.bottomAnchor, constant: 10),
            episodeDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            episodeDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        // 아이콘 3개 StackView 오토레이아웃 설정
        NSLayoutConstraint.activate([
            iconActionStackView.topAnchor.constraint(equalTo: episodeDescriptionLabel.bottomAnchor, constant: 50),
            iconActionStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30)
        ])
        
        // Bar 아이콘 오토레이아웃 설정
        NSLayoutConstraint.activate([
            barIcon.topAnchor.constraint(equalTo: iconActionStackView.bottomAnchor, constant: 20),
            barIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            barIcon.widthAnchor.constraint(equalToConstant: 63),
            barIcon.heightAnchor.constraint(equalToConstant: 4)
        ])
        
        // 아이콘 크기 개별 설정
        NSLayoutConstraint.activate([
            myListIcon.widthAnchor.constraint(equalToConstant: 35),
            myListIcon.heightAnchor.constraint(equalToConstant: 35),
            
            rateIcon.widthAnchor.constraint(equalToConstant: 35),
            rateIcon.heightAnchor.constraint(equalToConstant: 35),
            
            shareIcon.widthAnchor.constraint(equalToConstant: 35),
            shareIcon.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            textStackView.topAnchor.constraint(equalTo: barIcon.bottomAnchor, constant: 20),
            textStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            textStackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -20),
        ])
        
        // "Season 5" StackView 오토레이아웃 설정
        NSLayoutConstraint.activate([
            seasonStackView.topAnchor.constraint(equalTo: textStackView.bottomAnchor, constant: 20),
            seasonStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            seasonStackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -20)
        ])
        
        // dropDown 아이콘의 크기 설정
        NSLayoutConstraint.activate([
            dropDownIcon.widthAnchor.constraint(equalToConstant: 13),
            dropDownIcon.heightAnchor.constraint(equalToConstant: 8)
        ])
        
        NSLayoutConstraint.activate([
            additionalPlayLargeImageView.centerXAnchor.constraint(equalTo: additionalImageView.centerXAnchor),
            additionalPlayLargeImageView.centerYAnchor.constraint(equalTo: additionalImageView.centerYAnchor),
            additionalPlayLargeImageView.widthAnchor.constraint(equalToConstant: 35),
            additionalPlayLargeImageView.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        // Horizontal StackView AutoLayout 설정
        NSLayoutConstraint.activate([
            combinedStackView.topAnchor.constraint(equalTo: seasonStackView.bottomAnchor, constant: 20),
            combinedStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            combinedStackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -20),
            additionalImageView.heightAnchor.constraint(equalToConstant: 75),
            additionalImageView.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        // descriptionLabel 오토레이아웃 설정
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: combinedStackView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        // 5번 반복해서 복사
        var lastView: UIView = descriptionLabel // 반복 시 이전 view를 참조하기 위한 변수
        
        for _ in 1...5 {
            let additionalImageViewCopy = UIImageView(image: UIImage(named: imageName))
            additionalImageViewCopy.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(additionalImageViewCopy)
            
            let additionalPlayLargeImageViewCopy = UIImageView(image: UIImage(named: "playButton.png"))
            additionalPlayLargeImageViewCopy.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(additionalPlayLargeImageViewCopy)
            
            let episodeTextStackViewCopy = UIStackView(arrangedSubviews: [UILabel(), UILabel()])
            episodeTextStackViewCopy.axis = .vertical
            episodeTextStackViewCopy.alignment = .leading
            episodeTextStackViewCopy.spacing = 5
            episodeTextStackViewCopy.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(episodeTextStackViewCopy)
            
            let combinedStackViewCopy = UIStackView(arrangedSubviews: [additionalImageViewCopy, episodeTextStackViewCopy])
            combinedStackViewCopy.axis = .horizontal
            combinedStackViewCopy.spacing = 10
            combinedStackViewCopy.alignment = .center
            combinedStackViewCopy.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(combinedStackViewCopy)
            
            let descriptionLabelCopy = UILabel()
            descriptionLabelCopy.text = """
            Flying high: Chrishell reveals her latest love - Jason. In LA, the agents get real about the relationship while Christine readies her return.
            """
            descriptionLabelCopy.textColor = .white
            descriptionLabelCopy.font = UIFont.systemFont(ofSize: 14)
            descriptionLabelCopy.numberOfLines = 0
            descriptionLabelCopy.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(descriptionLabelCopy)
            
            // 오토레이아웃 설정
            NSLayoutConstraint.activate([
                additionalImageViewCopy.heightAnchor.constraint(equalToConstant: 75),
                additionalImageViewCopy.widthAnchor.constraint(equalToConstant: 150),
                
                additionalPlayLargeImageViewCopy.centerXAnchor.constraint(equalTo: additionalImageViewCopy.centerXAnchor),
                additionalPlayLargeImageViewCopy.centerYAnchor.constraint(equalTo: additionalImageViewCopy.centerYAnchor),
                additionalPlayLargeImageViewCopy.widthAnchor.constraint(equalToConstant: 35),
                additionalPlayLargeImageViewCopy.heightAnchor.constraint(equalToConstant: 35),
                
                combinedStackViewCopy.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 20),
                combinedStackViewCopy.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                combinedStackViewCopy.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -20),
                
                descriptionLabelCopy.topAnchor.constraint(equalTo: combinedStackViewCopy.bottomAnchor, constant: 20),
                descriptionLabelCopy.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                descriptionLabelCopy.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
            ])
            
            lastView = descriptionLabelCopy
        }
    }
}
