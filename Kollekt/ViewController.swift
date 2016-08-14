//
//  ViewController.swift
//  Kollekt
//
//  Created by Vik Denic on 8/13/16.
//  Copyright © 2016 vikzilla. All rights reserved.
//

import UIKit
import ScaledVisibleCellsCollectionView

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.setScaledDesginParam(scaledPattern: .horizontalCenter, maxScale: 1.2, minScale: 0.5, maxAlpha: 1.0, minAlpha: 0.75)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}
// MARK: - UICollectionView..
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

}

// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.scaledVisibleCells()
    }
}
