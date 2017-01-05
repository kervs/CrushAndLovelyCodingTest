//
//  BusinessDetailViewController.swift
//  CrushAndLovelyCodingTest
//
//  Created by Kervins Valcourt on 1/4/17.
//  Copyright © 2017 Crush and Lovely. All rights reserved.
//

import UIKit
import YelpAPI
import MapKit

class BusinessDetailViewController: UIViewController {
    private var detailVC: BusinessDetailView
    var business: Business

    init(_ location: Business) {
        detailVC = BusinessDetailView()
        detailVC.translatesAutoresizingMaskIntoConstraints = false

        self.business = location

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
        let allAnnotations = detailVC.mapView.annotations
        detailVC.mapView.removeAnnotations(allAnnotations)

        var locationAnnotation: [MKPointAnnotation] = []

        if  let location = business.location {
            let annotation = MKPointAnnotation()
            annotation.coordinate = location

            locationAnnotation.append(annotation)
        }

        detailVC.mapView.showAnnotations(locationAnnotation, animated: true)
        detailVC.title.text = business.name
    }

}
