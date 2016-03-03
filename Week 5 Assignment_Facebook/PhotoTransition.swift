//
//  PhotoTransition.swift
//  Week 5 Assignment_Facebook
//
//  Created by Corwin Crownover on 3/3/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class PhotoTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let photoViewController = toViewController as! PhotoViewController
        let feedViewController = fromViewController as! FeedViewController
        let destinationFrame = photoViewController.photoImageView.frame
        
        photoViewController.photoImageView.frame = feedViewController.selectedImageView.frame
        
        toViewController.view.alpha = 0
        
        UIView.animateWithDuration(duration, animations: {
            photoViewController.photoImageView.frame = destinationFrame
            toViewController.view.alpha = 1
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
    // weird things happening on dismiss: try version with simple ui animate to selectedImageView.frame (need to delete after?)
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let photoViewController = fromViewController as! PhotoViewController
        let feedViewController = toViewController as! FeedViewController
        let destinationFrame = feedViewController.selectedImageView.frame
        
        feedViewController.selectedImageView.frame = photoViewController.photoImageView.frame
        
        fromViewController.view.alpha = 1
        
        UIView.animateWithDuration(duration, animations: {
            feedViewController.selectedImageView.frame = destinationFrame
            fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }


}
