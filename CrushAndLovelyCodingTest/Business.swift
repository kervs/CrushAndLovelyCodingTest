//
//  Business.swift
//  CrushAndLovelyCodingTest
//
//  Created by Kervins Valcourt on 1/4/17.
//  Copyright © 2017 Crush and Lovely. All rights reserved.
//

import UIKit
import MapKit
import YelpAPI

class Business: NSObject {
    var name: String = ""
    var location: CLLocationCoordinate2D?
    var image: String = ""
    var id: String = ""

    init(model: YLPBusiness) {
        name = model.name
        id = model.identifier

        if let latitude = model.location.coordinate?.latitude,
            let longitude = model.location.coordinate?.longitude {
            location = CLLocationCoordinate2DMake(latitude, longitude)
        }

        if let imageURL = model.imageURL {
            image = imageURL.absoluteString
        }
    }

     init (data: [String : AnyObject]) {
        if let nameString = data["name"] as? String {
            name = nameString
        }

        if let idString = data["id"] as? String {
            id = idString
        }

        if let latitude = data["latitude"] as? Double,
            let longitude = data["longitude"] as? Double {
            location = CLLocationCoordinate2DMake(latitude, longitude)
        }

        if let imageURL = data["imageURL"] as? String {
            image = imageURL
        }
    }

    func dataChangedToDictionary() -> [String: AnyObject] {
        var businessData: [String: AnyObject] = [
            "id": id as AnyObject,
            "name": name as AnyObject,
            "image": image as AnyObject,
        ]

        if let latitude = location?.latitude,
            let longitude = location?.longitude {
                businessData["latitude"] = latitude as AnyObject
                businessData["longitude"] = longitude as AnyObject
        }

        return businessData
    }
}
