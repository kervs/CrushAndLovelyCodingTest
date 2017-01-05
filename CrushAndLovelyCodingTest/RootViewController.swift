//
//  RootViewController.swift
//  CrushAndLovelyCodingTest
//
//  Created by Kervins Valcourt on 1/3/17.
//  Copyright © 2017 Crush and Lovely. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    init() {
        super.init(nibName: nil, bundle: nil)

        setupTabBarItems()
    }

    func setupTabBarItems() {
        let mapVC = UINavigationController(rootViewController: MapViewController())
        let listVC = UINavigationController(rootViewController: BusinessListViewController())

        mapVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        listVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)

        viewControllers = [
            mapVC,
            listVC
        ]

        selectedIndex = 0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

