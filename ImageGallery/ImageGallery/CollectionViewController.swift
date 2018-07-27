//
//  CollectionCollectionViewController.swift
//  ImageGallery
//
//  Created by Mike Laursen on 7/26/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var images = ["Image1.png", "Image2.png", "Image3.png", "Image4.png", "Image5.png", "Image6.png", "Image1.png", "Image2.png", "Image3.png", "Image4.png", "Image5.png", "Image6.png", "Image1.png", "Image2.png", "Image3.png", "Image4.png", "Image5.png", "Image6.png", "Image1.png", "Image2.png", "Image3.png", "Image4.png", "Image5.png", "Image6.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        
        cell.layer.borderColor = UIColor.white.withAlphaComponent(0.25).cgColor
        cell.layer.borderWidth = 3
        cell.cellImage.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt atIndexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        var cellWidth = 0
        var cellHeight = 0
                
        if screenWidth == 375 { // iPhone 6, 6s, 7, 8, X
            cellWidth =  160
            cellHeight = 160
        } else if screenWidth == 414 { // iPhone 6 Plus, 6s Plus, 7 Plus, 8 Plus
            cellWidth = 180
            cellHeight = 180
        } else if screenWidth == 768 { // iPad Mini, Air
            cellWidth = 350
            cellHeight = 350
        } else if screenWidth == 834 { // iPad Pro 10.5
            cellWidth = 390
            cellHeight = 390
        } else if screenWidth == 1024 { // iPad Pro 9.7, 12.9
            cellWidth = 480
            cellHeight = 480
        } else {
            cellWidth = 135
            cellHeight = 135
        }
        
        return CGSize(width: cellWidth, height: cellHeight)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
