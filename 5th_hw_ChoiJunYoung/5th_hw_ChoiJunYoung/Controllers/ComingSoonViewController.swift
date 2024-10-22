//
//  ComingSoonViewController.swift
//  5th_hw_ChoiJunYoung
//
//  Created by Junyoung Choi on 10/4/24.
//

import UIKit

class ComingSoonViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // ScrollView 생성
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = .black
        scrollView.contentInsetAdjustmentBehavior = .always
        view.addSubview(scrollView)

        // Notification 아이콘 생성
        let notificationIcon = UIImageView()
        notificationIcon.image = UIImage(named: "notification_icon")
        notificationIcon.contentMode = .scaleAspectFit
        notificationIcon.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(notificationIcon)

        // Notification 레이블 생성
        let notificationLabel = UILabel()
        notificationLabel.text = "Notifications"
        notificationLabel.textColor = .white
        notificationLabel.font = UIFont.boldSystemFont(ofSize: 20)
        notificationLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(notificationLabel)

        // Notification 아이콘 및 레이블 오토 레이아웃 
        NSLayoutConstraint.activate([
            notificationIcon.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            notificationIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            notificationIcon.widthAnchor.constraint(equalToConstant: 30),
            notificationIcon.heightAnchor.constraint(equalToConstant: 30),

            notificationLabel.centerYAnchor.constraint(equalTo: notificationIcon.centerYAnchor),
            notificationLabel.leadingAnchor.constraint(equalTo: notificationIcon.trailingAnchor, constant: 10)
        ])
        
        // ScrollView의 ContentView 
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        // ContentView 오토 레이아웃 
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: notificationIcon.bottomAnchor, constant: 20),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        // ContentView 높이
        let contentHeight: CGFloat = 1700
        contentView.heightAnchor.constraint(equalToConstant: contentHeight).isActive = true

        // Upcoming Movie 1 이미지 추가
        let upcomingImageView1 = UIImageView()
        upcomingImageView1.image = UIImage(named: "upComingMovie1")
        upcomingImageView1.contentMode = .scaleAspectFill
        upcomingImageView1.clipsToBounds = true
        upcomingImageView1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(upcomingImageView1)

        // Upcoming Movie 1 이미지 오토 레이아웃
        NSLayoutConstraint.activate([
            upcomingImageView1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            upcomingImageView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            upcomingImageView1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            upcomingImageView1.heightAnchor.constraint(equalTo: upcomingImageView1.widthAnchor, multiplier: 9.0/16.0)
        ])

        // Share 아이콘 및 레이블1
        let shareIcon1 = UIImageView()
        shareIcon1.image = UIImage(named: "share_icon")
        shareIcon1.contentMode = .scaleAspectFit
        shareIcon1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(shareIcon1)

        let shareLabel1 = UILabel()
        shareLabel1.text = "Share"
        shareLabel1.textColor = .white
        shareLabel1.font = UIFont.systemFont(ofSize: 12)
        shareLabel1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(shareLabel1)

        // Share 아이콘 및 레이블1 오토 레이아웃
        NSLayoutConstraint.activate([
            shareIcon1.topAnchor.constraint(equalTo: upcomingImageView1.bottomAnchor, constant: 20),
            shareIcon1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            shareIcon1.widthAnchor.constraint(equalToConstant: 30),
            shareIcon1.heightAnchor.constraint(equalToConstant: 30),

            shareLabel1.topAnchor.constraint(equalTo: shareIcon1.bottomAnchor, constant: 5),
            shareLabel1.centerXAnchor.constraint(equalTo: shareIcon1.centerXAnchor)
        ])
        
        // Remind 아이콘 및 레이블1
        let remindIcon1 = UIImageView()
        remindIcon1.image = UIImage(named: "remind_icon")
        remindIcon1.contentMode = .scaleAspectFit
        remindIcon1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(remindIcon1)

        let remindLabel1 = UILabel()
        remindLabel1.text = "Remind Me"
        remindLabel1.textColor = .white
        remindLabel1.font = UIFont.systemFont(ofSize: 12)
        remindLabel1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(remindLabel1)

        // Remind 아이콘 및 레이블1 오토 레이아웃
        NSLayoutConstraint.activate([
            remindIcon1.topAnchor.constraint(equalTo: upcomingImageView1.bottomAnchor, constant: 20),
            remindIcon1.trailingAnchor.constraint(equalTo: shareIcon1.leadingAnchor, constant: -40),
            remindIcon1.widthAnchor.constraint(equalToConstant: 30),
            remindIcon1.heightAnchor.constraint(equalToConstant: 30),

            remindLabel1.topAnchor.constraint(equalTo: remindIcon1.bottomAnchor, constant: 5),
            remindLabel1.centerXAnchor.constraint(equalTo: remindIcon1.centerXAnchor)
        ])

        // 추가 텍스트 추가 (1)
        let seasonLabel1 = UILabel()
        seasonLabel1.text = "Season 1 Coming December 14"
        seasonLabel1.textColor = .white
        seasonLabel1.font = UIFont.systemFont(ofSize: 14)
        seasonLabel1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(seasonLabel1)

        let titleLabel1 = UILabel()
        titleLabel1.text = "Castle & Castle"
        titleLabel1.textColor = .white
        titleLabel1.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel1)

        let descriptionLabel1 = UILabel()
        descriptionLabel1.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam enim non posuere pulvinar diam."
        descriptionLabel1.textColor = .white
        descriptionLabel1.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel1.numberOfLines = 0 // 여러 줄을 허용
        descriptionLabel1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel1)

        // 장르 레이블 추가 (1)
        let genresLabel1 = UILabel()
        genresLabel1.text = "Steamy  •  Soapy  •  Slow Burn  •  Suspenseful  •  Teen  •  Mystery"
        genresLabel1.textColor = .white
        genresLabel1.font = UIFont.boldSystemFont(ofSize: 12)
        genresLabel1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(genresLabel1)

        // 추가 텍스트 오토 레이아웃 (1)
        NSLayoutConstraint.activate([
            seasonLabel1.topAnchor.constraint(equalTo: shareLabel1.bottomAnchor, constant: 30),
            seasonLabel1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            seasonLabel1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            titleLabel1.topAnchor.constraint(equalTo: seasonLabel1.bottomAnchor, constant: 5),
            titleLabel1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            descriptionLabel1.topAnchor.constraint(equalTo: titleLabel1.bottomAnchor, constant: 10),
            descriptionLabel1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionLabel1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            genresLabel1.topAnchor.constraint(equalTo: descriptionLabel1.bottomAnchor, constant: 5),
            genresLabel1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            genresLabel1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])

        // Upcoming Movie 2 이미지 추가
        let upcomingImageView2 = UIImageView()
        upcomingImageView2.image = UIImage(named: "upComingMovie2")
        upcomingImageView2.contentMode = .scaleAspectFill
        upcomingImageView2.clipsToBounds = true
        upcomingImageView2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(upcomingImageView2)

        // Upcoming Movie 2 이미지 오토 레이아웃
        NSLayoutConstraint.activate([
            upcomingImageView2.topAnchor.constraint(equalTo: genresLabel1.bottomAnchor, constant: 20),
            upcomingImageView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            upcomingImageView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            upcomingImageView2.heightAnchor.constraint(equalTo: upcomingImageView2.widthAnchor, multiplier: 9.0/16.0)
        ])

        // Share 아이콘 및 레이블 생성 (2)
        let shareIcon2 = UIImageView()
        shareIcon2.image = UIImage(named: "share_icon")
        shareIcon2.contentMode = .scaleAspectFit
        shareIcon2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(shareIcon2)

        let shareLabel2 = UILabel()
        shareLabel2.text = "Share"
        shareLabel2.textColor = .white
        shareLabel2.font = UIFont.systemFont(ofSize: 12)
        shareLabel2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(shareLabel2)

        // Share 아이콘 및 레이블 오토 레이아웃 (2)
        NSLayoutConstraint.activate([
            shareIcon2.topAnchor.constraint(equalTo: upcomingImageView2.bottomAnchor, constant: 20),
            shareIcon2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            shareIcon2.widthAnchor.constraint(equalToConstant: 30),
            shareIcon2.heightAnchor.constraint(equalToConstant: 30),

            shareLabel2.topAnchor.constraint(equalTo: shareIcon2.bottomAnchor, constant: 5),
            shareLabel2.centerXAnchor.constraint(equalTo: shareIcon2.centerXAnchor)
        ])
        
        // Remind 아이콘 및 레이블 생성 (2)
        let remindIcon2 = UIImageView()
        remindIcon2.image = UIImage(named: "remind_icon")
        remindIcon2.contentMode = .scaleAspectFit
        remindIcon2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(remindIcon2)

        let remindLabel2 = UILabel()
        remindLabel2.text = "Remind Me"
        remindLabel2.textColor = .white
        remindLabel2.font = UIFont.systemFont(ofSize: 12)
        remindLabel2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(remindLabel2)

        // Remind 아이콘 및 레이블 오토 레이아웃 (2)
        NSLayoutConstraint.activate([
            remindIcon2.topAnchor.constraint(equalTo: upcomingImageView2.bottomAnchor, constant: 20),
            remindIcon2.trailingAnchor.constraint(equalTo: shareIcon2.leadingAnchor, constant: -40),
            remindIcon2.widthAnchor.constraint(equalToConstant: 30),
            remindIcon2.heightAnchor.constraint(equalToConstant: 30),

            remindLabel2.topAnchor.constraint(equalTo: remindIcon2.bottomAnchor, constant: 5),
            remindLabel2.centerXAnchor.constraint(equalTo: remindIcon2.centerXAnchor)
        ])

        // 추가 텍스트 추가 (2)
        let seasonLabel2 = UILabel()
        seasonLabel2.text = ""
        seasonLabel2.textColor = .white
        seasonLabel2.font = UIFont.systemFont(ofSize: 14)
        seasonLabel2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(seasonLabel2)

        let titleLabel2 = UILabel()
        titleLabel2.text = "Tiny Pretty Things"
        titleLabel2.textColor = .white
        titleLabel2.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel2)

        let descriptionLabel2 = UILabel()
        descriptionLabel2.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam enim non posuere pulvinar diam."
        descriptionLabel2.textColor = .white
        descriptionLabel2.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel2.numberOfLines = 0
        descriptionLabel2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel2)

        // 장르 레이블 추가 (2)
        let genresLabel2 = UILabel()
        genresLabel2.text = "Steamy  •  Soapy  •  Slow Burn  •  Suspenseful  •  Teen  •  Mystery"
        genresLabel2.textColor = .white
        genresLabel2.font = UIFont.boldSystemFont(ofSize: 12)
        genresLabel2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(genresLabel2)

        // 추가 텍스트 오토 레이아웃 (2)
        NSLayoutConstraint.activate([
            seasonLabel2.topAnchor.constraint(equalTo: shareLabel2.bottomAnchor, constant: 30),
            seasonLabel2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            seasonLabel2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            titleLabel2.topAnchor.constraint(equalTo: seasonLabel2.bottomAnchor, constant: 5),
            titleLabel2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            descriptionLabel2.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 10),
            descriptionLabel2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionLabel2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            genresLabel2.topAnchor.constraint(equalTo: descriptionLabel2.bottomAnchor, constant: 5),
            genresLabel2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            genresLabel2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])

        // Upcoming Movie 3 이미지 추가
        let upcomingImageView3 = UIImageView()
        upcomingImageView3.image = UIImage(named: "upComingMovie3") // 3 이미지 
        upcomingImageView3.contentMode = .scaleAspectFill
        upcomingImageView3.clipsToBounds = true
        upcomingImageView3.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(upcomingImageView3)

        // Upcoming Movie 3 이미지 오토 레이아웃
        NSLayoutConstraint.activate([
            upcomingImageView3.topAnchor.constraint(equalTo: genresLabel2.bottomAnchor, constant: 20),
            upcomingImageView3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            upcomingImageView3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            upcomingImageView3.heightAnchor.constraint(equalTo: upcomingImageView3.widthAnchor, multiplier: 9.0/16.0)
        ])

        // Share 아이콘 및 레이블 생성 (3)
        let shareIcon3 = UIImageView()
        shareIcon3.image = UIImage(named: "share_icon")
        shareIcon3.contentMode = .scaleAspectFit
        shareIcon3.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(shareIcon3)

        let shareLabel3 = UILabel()
        shareLabel3.text = "Share"
        shareLabel3.textColor = .white
        shareLabel3.font = UIFont.systemFont(ofSize: 12)
        shareLabel3.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(shareLabel3)

        // Share 아이콘 및 레이블 오토 레이아웃 (3)
        NSLayoutConstraint.activate([
            shareIcon3.topAnchor.constraint(equalTo: upcomingImageView3.bottomAnchor, constant: 20),
            shareIcon3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            shareIcon3.widthAnchor.constraint(equalToConstant: 30),
            shareIcon3.heightAnchor.constraint(equalToConstant: 30),

            shareLabel3.topAnchor.constraint(equalTo: shareIcon3.bottomAnchor, constant: 5),
            shareLabel3.centerXAnchor.constraint(equalTo: shareIcon3.centerXAnchor)
        ])
        
        // Remind 아이콘 및 레이블 생성 (3)
        let remindIcon3 = UIImageView()
        remindIcon3.image = UIImage(named: "remind_icon")
        remindIcon3.contentMode = .scaleAspectFit
        remindIcon3.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(remindIcon3)

        let remindLabel3 = UILabel()
        remindLabel3.text = "Remind Me"
        remindLabel3.textColor = .white
        remindLabel3.font = UIFont.systemFont(ofSize: 12)
        remindLabel3.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(remindLabel3)

        // Remind 아이콘 및 레이블 오토 레이아웃 (3)
        NSLayoutConstraint.activate([
            remindIcon3.topAnchor.constraint(equalTo: upcomingImageView3.bottomAnchor, constant: 20),
            remindIcon3.trailingAnchor.constraint(equalTo: shareIcon3.leadingAnchor, constant: -40),
            remindIcon3.widthAnchor.constraint(equalToConstant: 30),
            remindIcon3.heightAnchor.constraint(equalToConstant: 30),

            remindLabel3.topAnchor.constraint(equalTo: remindIcon3.bottomAnchor, constant: 5),
            remindLabel3.centerXAnchor.constraint(equalTo: remindIcon3.centerXAnchor)
        ])

        // 추가 텍스트 추가 (3)
        let seasonLabel3 = UILabel()
        seasonLabel3.text = "Season 1 Coming December 14"
        seasonLabel3.textColor = .white
        seasonLabel3.font = UIFont.systemFont(ofSize: 14)
        seasonLabel3.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(seasonLabel3)

        let titleLabel3 = UILabel()
        titleLabel3.text = "Tiny Pretty Things"
        titleLabel3.textColor = .white
        titleLabel3.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel3.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel3)

        let descriptionLabel3 = UILabel()
        descriptionLabel3.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam enim non posuere pulvinar diam."
        descriptionLabel3.textColor = .white
        descriptionLabel3.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel3.numberOfLines = 0
        descriptionLabel3.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel3)

        // 장르 레이블 추가 (3)
        let genresLabel3 = UILabel()
        genresLabel3.text = "Steamy  •  Soapy  •  Slow Burn  •  Suspenseful  •  Teen  •  Mystery"
        genresLabel3.textColor = .white
        genresLabel3.font = UIFont.boldSystemFont(ofSize: 12)
        genresLabel3.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(genresLabel3)

        // 추가 텍스트 오토 레이아웃 (3)
        NSLayoutConstraint.activate([
            seasonLabel3.topAnchor.constraint(equalTo: shareLabel3.bottomAnchor, constant: 30),
            seasonLabel3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            seasonLabel3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            titleLabel3.topAnchor.constraint(equalTo: seasonLabel3.bottomAnchor, constant: 5),
            titleLabel3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            descriptionLabel3.topAnchor.constraint(equalTo: titleLabel3.bottomAnchor, constant: 10),
            descriptionLabel3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionLabel3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            genresLabel3.topAnchor.constraint(equalTo: descriptionLabel3.bottomAnchor, constant: 5),
            genresLabel3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            genresLabel3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
}

