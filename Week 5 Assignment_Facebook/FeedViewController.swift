//
//  FeedViewController.swift
//  Week 5 Assignment_Facebook
//
//  Created by Corwin Crownover on 3/3/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIScrollViewDelegate {
    
    // OUTLETS
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    
    
    var selectedImageView: UIImageView!
    var photoTransition: PhotoTransition!
    
    
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(320, feedImage.image!.size.height)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // FUNCTIONS
    @IBAction func didTap(sender: UITapGestureRecognizer) {
        print("did tap")
        
        selectedImageView = sender.view as! UIImageView
        
        performSegueWithIdentifier("PhotoSegue", sender: nil)
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let photoViewController = segue.destinationViewController as! PhotoViewController
        photoViewController.photo = selectedImageView.image
        
        photoTransition = PhotoTransition()
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        photoViewController.transitioningDelegate = photoTransition
    }

    
    
    
    
    
    

}
