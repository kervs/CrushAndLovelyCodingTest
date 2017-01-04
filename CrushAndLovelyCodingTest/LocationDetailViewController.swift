//
//  LocationDetailViewController.swift
//  CrushAndLovelyCodingTest
//
//  Created by Kervins Valcourt on 1/4/17.
//  Copyright © 2017 Crush and Lovely. All rights reserved.
//

import UIKit
import YelpAPI
import MapKit

class LocationDetailViewController: UIViewController {
    private var detailVC: LocationDetailView
    var locationItem: YLPBusiness

    init(_ location: YLPBusiness) {
        detailVC = LocationDetailView()
        detailVC.translatesAutoresizingMaskIntoConstraints = false

        self.locationItem = location

        super.init(nibName: nil, bundle: nil)

        view.addSubview(detailVC)

        setupLayout()
    }

    func setupLayout() {
        detailVC.snp.makeConstraints { view -> Void in
            view.top.equalToSuperview()
            view.bottom.equalToSuperview()
            view.left.equalToSuperview()
            view.right.equalToSuperview()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        reloadMapData()
    }

    func reloadMapData() {
        var locationAnnotation: [MKPointAnnotation] = []

        if  let latitude = locationItem.location.coordinate?.latitude,
            let longitude = locationItem.location.coordinate?.longitude {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

            locationAnnotation.append(annotation)
        }

        detailVC.mapView.showAnnotations(locationAnnotation, animated: true)
        detailVC.title.text = locationItem.name
    }

}
