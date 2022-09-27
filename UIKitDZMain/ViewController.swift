//
//  ViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 21.09.2022.
//

import UIKit

final class ViewController: UIViewController {

    var segmentControll = UISegmentedControl()
    var imageView = UIImageView()
    var menu = ["one", "two", "three"]
    var images = [UIImage(named: "обувь1.jpeg"),
                  UIImage(named: "обувь2.jpeg"),
                  UIImage(named: "обувь3.jpeg")]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.imageView.center = self.view.center
        self.imageView.image = self.images[0]
        self.view.addSubview(self.imageView)
        // create segment
        self.segmentControll = UISegmentedControl(items: self.menu)
        self.segmentControll.frame = CGRect(x: 100, y: 600, width: 200, height: 30)
        self.view.addSubview(self.segmentControll)
        
        self.segmentControll.addTarget(self, action: #selector(selegtedValue), for: .valueChanged)
    }
    
    @objc func selegtedValue(target: UISegmentedControl) {
        if target == self.segmentControll {
            let segmentIndex = target.selectedSegmentIndex
            self.imageView.image = self.images[segmentIndex]
            
            let printTerget = target.titleForSegment(at: segmentIndex)
            print(printTerget ?? "")
        }
    }
}
