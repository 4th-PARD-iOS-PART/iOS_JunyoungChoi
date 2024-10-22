//
//  MainTabBarController.swift
//  5th_hw_ChoiJunYoung
//
//  Created by Junyoung Choi on 10/4/24.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let comingSoonVC = ComingSoonViewController()
        let downloadsVC = DownloadsViewController()
        let moreVC = MoreViewController()

        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home_icon"), tag: 0)
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search_icon"), tag: 1)
        comingSoonVC.tabBarItem = UITabBarItem(title: "Coming Soon", image: UIImage(named: "comingsoon_icon"), tag: 2)
        downloadsVC.tabBarItem = UITabBarItem(title: "Downloads", image: UIImage(named: "downloads_icon"), tag: 3)
        moreVC.tabBarItem = UITabBarItem(title: "More", image: UIImage(named: "more_icon"), tag: 4)

        let controllers = [homeVC, searchVC, comingSoonVC, downloadsVC, moreVC]
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
        
        self.tabBar.tintColor = .white
        self.tabBar.barTintColor = .black
    }
}
