//
//  ViewController.swift
//  Kollekt
//
//  Created by Vik Denic on 8/13/16.
//  Copyright © 2016 vikzilla. All rights reserved.
//

import UIKit
import ScaledVisibleCellsCollectionView
import ChameleonFramework

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.setScaledDesginParam(scaledPattern: .horizontalCenter, maxScale: 1.1, minScale: 0.7, maxAlpha: 1.0, minAlpha: 0.5)
        
        collectionView.delegate = self
        collectionView.dataSource = self

        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: false)

        view.backgroundColor = GradientColor(.radial, frame: view.frame, colors: [UIColor.customPurple(), UIColor.customGreen()])
    }

    func update() {
        collectionView.scaledVisibleCells()
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
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        (segue.destination as! DetailViewController).previousVC = self
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let xInset = (UIScreen.main.bounds.width / 2) - 250 / 2
        return UIEdgeInsets(top: 0, left: xInset, bottom: 0, right: xInset)
    }

}

// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        ScaleHelper.scrollViewWillEndDragging(scrollView, for: collectionView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
}

extension UIColor {
    class func customGreen() -> UIColor {
        return UIColor(red: 112/255.0, green: 194/255.0, blue: 189/255.0, alpha: 1.0)
    }

    class func customPurple() -> UIColor {
        return UIColor(red: 140/255.0, green: 90/255.0, blue: 190/255.0, alpha: 1.0)
    }

    class func customLightGray() -> UIColor {
        return UIColor(red: 114/255.0, green: 114/255.0, blue: 114/255.0, alpha: 0.8)
    }

    class func customDarkGray() -> UIColor {
        return UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 0.8)
    }
}








