//
//  BusinessListViewController.swift
//  CrushAndLovelyCodingTest
//
//  Created by Kervins Valcourt on 1/3/17.
//  Copyright © 2017 Crush and Lovely. All rights reserved.
//

import UIKit
import YelpAPI
import Alamofire
import AlamofireImage

let cellReuseIdentifer = "cellReuseIdentifier"

class BusinessListViewController: BaseViewController,
    UICollectionViewDelegate,
    UICollectionViewDataSource {
    private var listView: ListCollectionView

    override init(viewModel: BrowseViewModel = BrowseViewModel()) {
        listView = ListCollectionView()
        listView.translatesAutoresizingMaskIntoConstraints = false
        listView.backgroundColor = UIColor.white

        super.init(viewModel: viewModel)

        listView.dataSource = self
        listView.delegate = self
        listView.register(BusinessCollectionCell.self, forCellWithReuseIdentifier: cellReuseIdentifer)

        view.insertSubview(listView, belowSubview: reloadButton)

        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupLayout() {
        super.setupLayout()
        
        listView.snp.makeConstraints { view -> Void in
            view.top.equalToSuperview()
            view.bottom.equalToSuperview()
            view.left.equalToSuperview()
            view.right.equalToSuperview()
        }

    }

    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.businesses.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if viewModel.businesses.count == 0 {
            return UICollectionViewCell()
        }

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifer, for: indexPath as IndexPath) as? BusinessCollectionCell,
            let business = viewModel.businesses[indexPath.row]  else {
                return UICollectionViewCell()
        }

        cell.titleLabel.text = business.name

        Alamofire.request(business.image).responseImage { response in
            debugPrint(response)

            if let image = response.result.value {
                cell.businessImage.image = image
            }
        }


        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let business = viewModel.businesses[indexPath.row]  else {
            return
        }

        let vc = BusinessDetailViewController(business)
        vc.view.backgroundColor = UIColor.white
        navigationController?.pushViewController(vc, animated: true)
    }

    override func browseViewModelDidUpdateBusinessesNearUser(_ browseViewModel: BrowseViewModel, businesses: [Business?]) {
        listView.reloadData()
    }
}
