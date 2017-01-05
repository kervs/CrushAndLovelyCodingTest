//
//  MapViewController.swift
//  CrushAndLovelyCodingTest
//
//  Created by Kervins Valcourt on 1/3/17.
//  Copyright © 2017 Crush and Lovely. All rights reserved.
//

import UIKit
import YelpAPI
import SnapKit
import MapKit

class MapViewController: BaseViewController {
    private var mapView: MKMapView

    override init(viewModel: BrowseViewModel = BrowseViewModel()) {
        mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false

        super.init(viewModel: viewModel)

        view.insertSubview(mapView, belowSubview: reloadButton)

        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupLayout() {
        super.setupLayout()
        
        mapView.snp.makeConstraints { view -> Void in
            view.top.equalToSuperview()
            view.bottom.equalToSuperview()
            view.left.equalToSuperview()
            view.right.equalToSuperview()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        reloadMapData()
    }

    func reloadMapData() {
        let allAnnotations = self.mapView.annotations
        mapView.removeAnnotations(allAnnotations)

        var locationAnnotation: [MKPointAnnotation] = []

        for item in viewModel.businesses {
            if let business = item,
                let location = business.location {
                let annotation = MKPointAnnotation()
                annotation.coordinate = location

                locationAnnotation.append(annotation)
            }
        }

        mapView.showAnnotations(locationAnnotation, animated: true)
    }
    
    override func browseViewModelDidUpdateBusinessesNearUser(_ browseViewModel: BrowseViewModel, businesses: [Business?]) {
        reloadMapData()
    }
}
