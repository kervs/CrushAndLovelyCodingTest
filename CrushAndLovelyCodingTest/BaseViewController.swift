//
//  BaseViewController.swift
//  CrushAndLovelyCodingTest
//
//  Created by Kervins Valcourt on 1/4/17.
//  Copyright © 2017 Crush and Lovely. All rights reserved.
//

import UIKit
import YelpAPI

class BaseViewController: UIViewController,
    BrowseViewModelDelegate {
    var viewModel: BrowseViewModel
    var reloadButton: UIButton

    init(viewModel: BrowseViewModel) {
        self.viewModel = viewModel

        reloadButton = UIButton()
        reloadButton.translatesAutoresizingMaskIntoConstraints = false
        reloadButton.backgroundColor = UIColor.red
        reloadButton.layer.cornerRadius = 22

        super.init(nibName: nil, bundle: nil)

        self.viewModel.delegate = self
        self.viewModel.createYelpClient()
        
         reloadButton.addTarget(self, action: #selector(BaseViewController.reloadButtonDidTap(sender:)), for: .touchUpInside)

        view.addSubview(reloadButton)
    }

    func setupLayout() {
        reloadButton.snp.makeConstraints { view -> Void in
            view.height.equalTo(45)
            view.width.equalTo(45)
            view.bottom.equalToSuperview().offset(-60)
            view.right.equalToSuperview().offset(-20)
        }
    }

    func reloadButtonDidTap(sender: UIButton) {
        viewModel.fetchYelpLocationsNearUser()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func browseViewModelYelpClientCreate(_ browseViewModel: BrowseViewModel) {
        viewModel.fetchYelpLocationsNearUser()
    }

    func browseViewModelDidUpdateBusinessesNearUser(_ browseViewModel: BrowseViewModel, businesses: [Business?]) {

    }
}
