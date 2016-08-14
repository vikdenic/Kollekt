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

// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let pageWidth = CGFloat(200 + 30) //cellWidth + interItemLineSpacing

        let currentOffset = scrollView.contentOffset.x
        let targetOffset = targetContentOffset.pointee.x
        var newTargetOffset = CGFloat(0)

        if targetOffset > currentOffset {
            newTargetOffset = CGFloat(ceilf(Float((currentOffset / pageWidth) * pageWidth)))
        } else {
            newTargetOffset = CGFloat(ceilf(Float((currentOffset / pageWidth) * pageWidth)))
        }

        if newTargetOffset < 0 {
            newTargetOffset = 0
        } else if newTargetOffset > scrollView.contentSize.width {
            newTargetOffset = scrollView.contentSize.width
        }

        targetContentOffset.pointee.x = currentOffset
        scrollView.setContentOffset(CGPoint(x: newTargetOffset, y: 0), animated: true)

        var index = Int(newTargetOffset / pageWidth)

        if index == 0 { //If first index
            var cell = collectionView.cellForItem(at: IndexPath(item: index, section: 0))

            UIView.animate(withDuration: animationSpeed, animations: { 
                cell?.transform = .identity
            })
            cell = collectionView.cellForItem(at: IndexPath(item: index + 1, section: 0))
            UIView.animate(withDuration: animationSpeed, animations: {
                cell?.transform = self.transformCellValue
            })
        } else {
            var cell = collectionView.cellForItem(at: IndexPath(item: index, section: 0))
            UIView.animate(withDuration: animationSpeed, animations: {
                cell?.transform = .identity
            })
            index -= 1 //left
            cell = collectionView.cellForItem(at: IndexPath(item: index, section: 0))
            UIView.animate(withDuration: animationSpeed, animations: {
                cell?.transform = self.transformCellValue
            })

            index += 1
            index += 1
            cell = collectionView.cellForItem(at: IndexPath(item: index, section: 0))
            UIView.animate(withDuration: animationSpeed, animations: {
                cell?.transform = self.transformCellValue
            })
        }
    }
}






















