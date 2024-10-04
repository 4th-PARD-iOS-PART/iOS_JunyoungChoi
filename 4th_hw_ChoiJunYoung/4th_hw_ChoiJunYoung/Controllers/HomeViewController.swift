//
//  HomeViewController.swift
//  4th_hw_ChoiJunYoung
//
//  Created by Junyoung Choi on 10/4/24.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

        // ScrollView 생성
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = .black
        
        // Safe area 무시
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * 2)
        view.addSubview(scrollView)

        // ImageView 생성
        let imageView = UIImageView(image: UIImage(named: "movie1"))
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 5, width: view.frame.width, height: view.frame.height * 0.4)
        scrollView.addSubview(imageView)

        // 그라데이션 레이어 생성
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: view.frame.height * 0.45, width: view.frame.width, height: 50) // 그라데이션 크기
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0) // 그라데이션 시작점
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1) // 그라데이션 끝점
        scrollView.layer.addSublayer(gradientLayer)

        // 상단 View 생성
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        topView.backgroundColor = .clear
        scrollView.addSubview(topView)

        // Netflix 로고
        let logoImageView = UIImageView(image: UIImage(named: "netflix_icon"))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.frame = CGRect(x: 20, y: 50, width: 60, height: 60)
        topView.addSubview(logoImageView)

        // 텍스트 (TV Shows, Movies, My List)
        let labels = ["TV Shows", "Movies", "My List"]
        let labelFont = UIFont.systemFont(ofSize: 20)

        for (index, text) in labels.enumerated() {
            let label = UILabel()
            label.text = text
            label.textColor = .white
            label.font = labelFont
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.5

            // 각각의 텍스트 위치 설정
            let labelWidth: CGFloat = 80
            let labelXPosition = 100 + CGFloat(index) * (labelWidth + 30)
            label.frame = CGRect(x: labelXPosition, y: 60, width: labelWidth, height: 30)
            topView.addSubview(label)
        }

        // 중앙 View (Play 버튼, My List, Info)
        let centerView = UIView(frame: CGRect(x: 0, y: view.frame.height * 0.5, width: view.frame.width, height: 150))
        centerView.backgroundColor = .black
        scrollView.addSubview(centerView)

        // Play
        let playButton = UIButton(type: .system)
        playButton.frame = CGRect(x: (view.frame.width - 110) / 2, y: 20, width: 110, height: 50)
        playButton.backgroundColor = UIColor.lightGray
        playButton.layer.cornerRadius = 5

        let iconImage = UIImage(named: "vector_icon")
        let iconAttachment = NSTextAttachment()
        iconAttachment.image = iconImage
        iconAttachment.bounds = CGRect(x: 0, y: -5, width: 20, height: 22)

        let space = NSAttributedString(string: "  ")
        let fullString = NSMutableAttributedString(string: "")
        fullString.append(NSAttributedString(attachment: iconAttachment))
        fullString.append(space)
        fullString.append(NSAttributedString(string: " Play", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.black]))

        playButton.setAttributedTitle(fullString, for: .normal)
        centerView.addSubview(playButton)

        // My List
        let myListIcon = UIImageView(image: UIImage(named: "myList_icon"))
        myListIcon.frame = CGRect(x: (view.frame.width / 2) - 150, y: 20, width: 30, height: 30)
        centerView.addSubview(myListIcon)

        let myListLabel = UILabel()
        myListLabel.text = "My List"
        myListLabel.textColor = .white
        myListLabel.textAlignment = .center
        myListLabel.font = UIFont.systemFont(ofSize: 15)
        myListLabel.frame = CGRect(x: myListIcon.frame.origin.x - 13.5, y: 50, width: 60, height: 20)
        centerView.addSubview(myListLabel)

        // Info
        let infoIcon = UIImageView(image: UIImage(named: "info_icon"))
        infoIcon.frame = CGRect(x: (view.frame.width / 2) + 110, y: 20, width: 30, height: 30)
        centerView.addSubview(infoIcon)

        let infoLabel = UILabel()
        infoLabel.text = "Info"
        infoLabel.textColor = .white
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.systemFont(ofSize: 15)
        infoLabel.frame = CGRect(x: infoIcon.frame.origin.x - 13.5, y: 50, width: 60, height: 20)
        centerView.addSubview(infoLabel)

        // Collection View
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 103, height: 161)
        layout.minimumInteritemSpacing = 7
        
        var currentY: CGFloat = view.frame.height * 0.65
        
        let headerTitles = ["Popular on Netflix", "Trending Now", "Top 10 in Nigeria Today", "My List", "African Movies", "Nollywood Movies & TV"]
        
        for i in 0..<6 { // Collection View 추가
            let collectionView = UICollectionView(frame: CGRect(x: 0, y: currentY, width: view.frame.width, height: 225), collectionViewLayout: layout)
            collectionView.backgroundColor = .black
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
            scrollView.addSubview(collectionView)
            
            // Header 추가
            let headerView = UICollectionReusableView(frame: CGRect(x: 0, y: -10, width: view.frame.width, height: 40))
            headerView.backgroundColor = UIColor.clear
            let headerLabel = UILabel(frame: headerView.bounds)
            headerLabel.text = headerTitles[i] // 헤더 문장 배열에서 가져오기
            headerLabel.textColor = .white
            headerLabel.font = UIFont.boldSystemFont(ofSize: 25)
            headerLabel.textAlignment = .left
            headerLabel.sizeToFit()
            headerLabel.frame.origin = CGPoint(x: 5, y: 5)
            headerView.addSubview(headerLabel)
            collectionView.addSubview(headerView)
            
            currentY += 225 + 22
        }

        // ScrollView의 contentSize 업데이트
        scrollView.contentSize = CGSize(width: view.bounds.width, height: currentY + 70)
    }

    // UICollectionViewDataSource 프로토콜 메서드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        // 현재 컬렉션 뷰의 인덱스에 따라 이미지를 설정
        let collectionIndex = Int((collectionView.frame.origin.y - (view.frame.height * 0.65)) / (225 + 22))
        let imageIndex = collectionIndex * 6 + indexPath.item
        
        if imageIndex < movieImages.count {
            cell.imageView.image = UIImage(named: movieImages[imageIndex])
        }
        
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.layer.cornerRadius = 5
        cell.imageView.layer.masksToBounds = true
        return cell
    }

    // 간격 조정을 위한 UICollectionViewDelegateFlowLayout 메서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
}

// Custom Cell 클래스
class MovieCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 5
        iv.layer.masksToBounds = true
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
