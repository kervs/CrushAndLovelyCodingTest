//
//  LocationDetailView.swift
//  CrushAndLovelyCodingTest
//
//  Created by Kervins Valcourt on 1/4/17.
//  Copyright © 2017 Crush and Lovely. All rights reserved.
//

import UIKit
import MapKit
import SnapKit

class LocationDetailView: UIView {
    var mapView: MKMapView
    var title: UILabel

    override init(frame: CGRect) {
        mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false

        title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.numberOfLines = 0

        super.init(frame: frame)

        backgroundColor = UIColor.white

        addSubview(mapView)
        addSubview(title)

        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        mapView.snp.makeConstraints { view -> Void in
            view.top.equalToSuperview()
            view.bottom.equalTo(self.snp.centerY)
            view.left.equalToSuperview()
            view.right.equalToSuperview()
        }

        title.snp.makeConstraints { view -> Void in
            view.top.equalTo(mapView.snp.bottom).offset(20)
            view.left.equalToSuperview()
            view.right.equalToSuperview()
        }

    }
}
