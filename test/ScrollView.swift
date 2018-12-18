//
//  ScrollView.swift
//  test
//
//  Created by Camille Vandenbussche on 31/10/2018.
//  Copyright © 2018 Camille Vandenbussche. All rights reserved.
//

import UIKit

class ScrollView: UIScrollView {

    //MARK: - Configure scrollView to display new image
    func display(_ image: UIImage) {
        
        //1. clear the previous image
        zoomView?.removeFromSuperview()
        zoomView = nil
        
        //2. make a new UIImageView for the new image
        zoomView = UIImageView(image: image)
        self.addSubview(zoomView)

}
