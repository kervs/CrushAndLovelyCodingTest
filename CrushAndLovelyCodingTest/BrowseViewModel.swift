//
//  BrowseViewModel.swift
//  CrushAndLovelyCodingTest
//
//  Created by Kervins Valcourt on 1/3/17.
//  Copyright © 2017 Crush and Lovely. All rights reserved.
//

import Foundation
import YelpAPI
import CoreLocation

class BrowseViewModel: NSObject {
    private var yelpClient: YLPClient?
    weak var delegate: BrowseViewModelDelegate?
    var businesses: [Business?]

    override init() {
        businesses = []

        super.init()
    }

    func createYelpClient() {
        YLPClient.authorize(withAppId: yelpAppID, secret: yelpAppSecret) { client, err in
            self.yelpClient = client

            if client == nil {
                print("Authentication failed: \(err)")
            } else {
                self.delegate?.browseViewModelYelpClientCreate(self)
            }
        }
    }

    func fetchYelpLocationsNearUser(latitude: Double = currentUserLocation.coordinate.latitude, longitude: Double = currentUserLocation.coordinate.longitude) {
        yelpClient?.search(with: YLPCoordinate(latitude: latitude, longitude: longitude), completionHandler: { result, err in
            if result != nil {
                if let yelpBusinessItems = result?.businesses {
                    for item in yelpBusinessItems {
                        let bizModel = Business(model: item)
                        self.businesses.append(bizModel)
                    }

                    self.delegate?.browseViewModelDidUpdateBusinessesNearUser(self, businesses: self.businesses)
                }

            } else {
                print("Search failed: \(err)")
            }
        })
    }

}
protocol BrowseViewModelDelegate: class {
    func browseViewModelYelpClientCreate(_ browseViewModel: BrowseViewModel)
    func browseViewModelDidUpdateBusinessesNearUser(_ browseViewModel: BrowseViewModel, businesses: [Business?])
}
