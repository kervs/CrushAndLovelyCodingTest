//
//  LocationListViewController.swift
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

class LocationListViewController: BaseViewController,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    private var locationListView: ListCollectionView

    override init(viewModel: BrowseViewModel = BrowseViewModel()) {
        locationListView = ListCollectionView()
        locationListView.translatesAutoresizingMaskIntoConstraints = false
        locationListView.backgroundColor = UIColor.white

        super.init(viewModel: viewModel)

        locationListView.dataSource = self
        locationListView.delegate = self
        locationListView.register(LoactionCollectionCell.self, forCellWithReuseIdentifier: cellReuseIdentifer)

        view.insertSubview(locationListView, belowSubview: reloadButton)

        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupLayout() {
        super.setupLayout()
        
        locationListView.snp.makeConstraints { view -> Void in
            view.top.equalToSuperview()
            view.bottom.equalToSuperview()
            view.left.equalToSuperview()
            view.right.equalToSuperview()
        }

    }

    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.locations.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if viewModel.locations.count == 0 {
            return UICollectionViewCell()
        }

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifer, for: indexPath as IndexPath) as? LoactionCollectionCell,
            let location = viewModel.locations[indexPath.row]  else {
                return UICollectionViewCell()
        }

        cell.titleLabel.text = location.name

        if let imageURL = location.imageURL {
            Alamofire.request(imageURL.absoluteString).responseImage { response in
                debugPrint(response)

                if let image = response.result.value {
                   cell.locationImage.image = image
                }
            }
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let location = viewModel.locations[indexPath.row]  else {
            return
        }

        let vc = LocationDetailViewController(location)
        vc.view.backgroundColor = UIColor.white
        navigationController?.pushViewController(vc, animated: true)
    }

    override func browseViewModelDidUpdateLocation(_ browseViewModel: BrowseViewModel, location: [YLPBusiness]) {
        locationListView.reloadData()
    }
}
