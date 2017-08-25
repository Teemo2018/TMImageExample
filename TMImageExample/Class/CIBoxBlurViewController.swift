//
//  CIBoxBlurViewController.swift
//  TMImageExample
//
//  Created by Teemo on 24/08/2017.
//  Copyright © 2017 Teemo. All rights reserved.
//

import UIKit
import CoreImage

class CIBoxBlurViewController: TMBaseViewController {

    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(imageView)
        imageView.frame = CGRect.init(x: 0, y: 100, width: 200, height: 150)
        let img = self.getResultImage()
        imageView.image = img
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getResultImage() -> UIImage {
     
        
        let myimg = UIImage(named:"img01")!.cgImage!
        let ciimage = CIImage(cgImage:myimg)
        
        let filter = CIFilter(name:"CIGaussianBlur")!
    
        filter.setValue(ciimage, forKey: kCIInputImageKey)
        filter.setValue(2, forKey: kCIInputRadiusKey)
        let result = filter.outputImage!
//        let cgImage = context.createCGImage(result, from: result.extent)
        
        return UIImage.init(ciImage: result)
    }

}
