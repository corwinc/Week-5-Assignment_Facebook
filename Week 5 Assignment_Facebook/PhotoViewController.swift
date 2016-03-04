//
//  PhotoViewController.swift
//  Week 5 Assignment_Facebook
//
//  Created by Corwin Crownover on 3/3/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    // OUTLETS
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var doneButtonUIImage: UIImageView!
    @IBOutlet weak var photoActionsUIImage: UIImageView!
    
    var photo: UIImage!
    
    
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(320, 570)
        
        scrollView.backgroundColor = UIColor(white:0, alpha:1)
        
        photoImageView.image = photo
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    // FUNCTIONS
    @IBAction func onDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // Scroll Events
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let alpha = convertValue(scrollView.contentOffset.y, r1Min: 0, r1Max: -50, r2Min: 1, r2Max: 0)
        
        scrollView.backgroundColor = UIColor(white: 0, alpha: alpha)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.doneButtonUIImage.alpha = 0
            self.photoActionsUIImage.alpha = 0
        }
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            
            if scrollView.contentOffset.y <= -50 {
                print("content offset >=50")
                dismissViewControllerAnimated(true, completion: nil)
                
            } else if scrollView.contentOffset.y > -50 {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.doneButtonUIImage.alpha = 1
                    self.photoActionsUIImage.alpha = 1
                })

            }
    }
    
    
    
    // Zoom
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return photoImageView
    }
    
    

    

}
