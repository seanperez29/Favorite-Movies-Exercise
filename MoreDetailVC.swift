//
//  MoreDetailVC.swift
//  Favorite Movies Exercise
//
//  Created by Sean Perez on 5/2/16.
//  Copyright © 2016 Sean Perez. All rights reserved.
//

import UIKit
import CoreData

class MoreDetailVC: UIViewController {
    
    @IBOutlet weak var actressImg: UIImageView!
    @IBOutlet weak var actressName: UILabel!
    @IBOutlet weak var actressDesc: UILabel!
    
    var imdblink: String!
    
    var actress: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let theActress = actress {
            actressImg.image = theActress.getMovieImage()
            actressDesc.text = theActress.desc
            actressName.text = theActress.title
            imdblink = theActress.link
        }
        
        
    }
    
    @IBAction func backBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "WebView" {
            if let link = imdblink, let vc = segue.destinationViewController as? WebViewVC {
                vc.imdbLink = link
            }
        }
    }
}