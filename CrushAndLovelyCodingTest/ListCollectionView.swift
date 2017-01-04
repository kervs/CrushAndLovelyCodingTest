//
//  ListCollectionView.swift
//  CrushAndLovelyCodingTest
//
//  Created by Kervins Valcourt on 1/4/17.
//  Copyright © 2017 Crush and Lovely. All rights reserved.
//

import UIKit
import SnapKit

class ListCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: ListCollectionView.provideCollectionViewLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    class func provideCollectionViewLayout() -> UICollectionViewLayout {
        let screenWidth = UIScreen.main.bounds.size.width
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        viewLayout.itemSize = CGSize(width: screenWidth - 13.3, height: 73.5)
        viewLayout.minimumInteritemSpacing = 3
        viewLayout.minimumLineSpacing = 3
        viewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return viewLayout
    }
}
