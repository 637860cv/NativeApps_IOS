//
//  ImageViewController.swift
//  test
//
//  Created by Camille Vandenbussche on 12/12/2018.
//  Copyright © 2018 Camille Vandenbussche. All rights reserved.
//

import Foundation
import UIKit


class ImageViewController: UIViewController, UIScrollViewDelegate{
    
   
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.minimumZoomScale=1.0
        self.scrollView.maximumZoomScale=6.0
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
}
