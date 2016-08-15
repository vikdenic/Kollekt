//
//  DetailViewController.swift
//  Kollekt
//
//  Created by Vik Denic on 8/14/16.
//  Copyright © 2016 vikzilla. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var previousVC : ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        previousVC.collectionView.isHidden = true

        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.frame
        view.addSubview(blurView)

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        previousVC.collectionView.isHidden = false
        dismiss(animated: true, completion: nil)
    }

}
