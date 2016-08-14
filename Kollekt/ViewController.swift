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

        collectionView.setScaledDesginParam(scaledPattern: .horizontalCenter, maxScale: 1.1, minScale: 0.7, maxAlpha: 1.0, minAlpha: 0.5)

        collectionView.delegate = self
        collectionView.dataSource = self
    }

}
// MARK: - UICollectionView..
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.scaledVisibleCells()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let xInset = (UIScreen.main.bounds.width / 2) - 200 / 2
        return UIEdgeInsets(top: 0, left: xInset, bottom: 0, right: xInset)
    }

}

// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        ScaleHelper.scrollViewWillEndDragging(scrollView, for: collectionView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
}






















