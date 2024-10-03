//
//  ViewController.swift
//  3rd_hw_ChoiJunYoung
//
//  Created by Junyoung Choi on 10/3/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // 탭 바 설정
        setupTabBar()
    }

    func setupTabBar() {
        let tabBar = UITabBar()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabBar)

        // 아이템 설정
        let homeItem = UITabBarItem(title: "Home", image: UIImage(named: "home_icon"), tag: 0)
        let searchItem = UITabBarItem(title: "Search", image: UIImage(named: "search_icon"), tag: 1)
        let comingSoonItem = UITabBarItem(title: "Coming Soon", image: UIImage(named: "comingsoon_icon"), tag: 2)
        let downloadsItem = UITabBarItem(title: "Downloads", image: UIImage(named: "downloads_icon"), tag: 3)
        let moreItem = UITabBarItem(title: "More", image: UIImage(named: "more_icon"), tag: 4)

        tabBar.items = [homeItem, searchItem, comingSoonItem, downloadsItem, moreItem]

        // 오토 레이아웃 설정
        NSLayoutConstraint.activate([
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // 탭 바 클릭 시 대응하는 ViewController로 이동
        tabBar.delegate = self
    }
}

// MARK: - UITabBarDelegate
extension ViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            let homeVC = HomeViewController()
            navigationController?.pushViewController(homeVC, animated: true)
        case 1:
            let searchVC = SearchViewController()
            navigationController?.pushViewController(searchVC, animated: true)
        case 2:
            let comingSoonVC = ComingSoonViewController()
            navigationController?.pushViewController(comingSoonVC, animated: true)
        case 3:
            let downloadsVC = DownloadsViewController()
            navigationController?.pushViewController(downloadsVC, animated: true)
        case 4:
            let moreVC = MoreViewController()
            navigationController?.pushViewController(moreVC, animated: true)
        default:
            break
        }
    }
}

