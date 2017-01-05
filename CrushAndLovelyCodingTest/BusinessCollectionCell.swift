//
//  BusinessCollectionCell.swift
//  CrushAndLovelyCodingTest
//
//  Created by Kervins Valcourt on 1/3/17.
//  Copyright © 2017 Crush and Lovely. All rights reserved.
//

import UIKit

class BusinessCollectionCell: UICollectionViewCell  {
    private var cellDivider: UIView

    var businessImage: UIImageView
    var titleLabel: UILabel

    override init (frame: CGRect) {
        cellDivider = UIView()
        cellDivider.translatesAutoresizingMaskIntoConstraints = false
        cellDivider.backgroundColor = UIColor.gray
        cellDivider.alpha = 0.5

        businessImage = UIImageView()
        businessImage.translatesAutoresizingMaskIntoConstraints = false
        businessImage.backgroundColor = UIColor.gray
        businessImage.layer.cornerRadius = 3

        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.gray
        titleLabel.text = ""

        super.init(frame: frame)

        backgroundColor = UIColor.white

        addSubview(cellDivider)
        addSubview(businessImage)
        addSubview(titleLabel)

        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        cellDivider.snp.makeConstraints { view in
            view.left.equalToSuperview()
            view.right.equalToSuperview()
            view.top.equalToSuperview()
            view.height.equalTo(0.7)
        }

        businessImage.snp.makeConstraints { view in
            view.left.equalTo(snp.left).offset(10.0)
            view.centerY.equalTo(snp.centerY)
            view.width.equalTo(50.0)
            view.height.equalTo(50.0)
        }

        titleLabel.snp.makeConstraints { view in
            view.bottom.equalTo(snp.centerY)
            view.left.equalTo(businessImage.snp.right).offset(10)
            view.right.equalToSuperview().offset(-42)
        }
    }

}
