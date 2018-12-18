import UIKit

class ImageScrollView: UIScrollView {
    
    var zoomView: UIImageView!
    
    //1. Initialize imageScrollView and adding it to viewControllers view
    self.imageScrollView = ImageScrollView(frame: self.view.bounds)
    self.view.addSubview(self.imageScrollView)
    
    //2. Making an image from our photo path
    let imagePath = Bundle.main.path(forResource: "225H", ofType: "jpg")!
    let image = UIImage(contentsOfFile: imagePath)!
    
    //3. Ask imageScrollView to show image
    self.imageScrollView.display(image)
    
    //MARK: - Configure scrollView to display new image
    func display(_ image: UIImage) {
        
        //1. clear the previous image
        zoomView?.removeFromSuperview()
        zoomView = nil
        
        //2. make a new UIImageView for the new image
        zoomView = UIImageView(image: image)
        self.addSubview(zoomView)
        
        
        
    }
    
    
    
}
