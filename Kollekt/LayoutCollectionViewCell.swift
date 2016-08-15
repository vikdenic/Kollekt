//
//  LayoutCollectionViewCell.swift
//  Kollekt
//
//  Created by Vik Denic on 8/14/16.
//  Copyright © 2016 vikzilla. All rights reserved.
//

import UIKit
import ChameleonFramework

class LayoutCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        layer.cornerRadius = 14
        clipsToBounds = true

        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = frame
        addSubview(blurView)
    }

}
