//
//  ViewController.swift
//  Kollekt
//
//  Created by Vik Denic on 8/13/16.
//  Copyright © 2016 vikzilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    let transformCellValue = CGAffineTransform(scaleX: 1.0, y: 0.80)
    let animationSpeed = 0.2
    var isFirstTimeTransform = true

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
// MARK: - UICollectionView..
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        if indexPath.row == 0 && isFirstTimeTransform == true {
            isFirstTimeTransform = false
        } else {
            cell.transform = transformCellValue
        }
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
        ScaleHelper.scrollViewWillEndDragging(scrollView, for: collectionView, withVelocity: velocity, targetContentOffset: targetContentOffset, transformCellValue: transformCellValue, animationSpeed: animationSpeed)
    }
    
}






















