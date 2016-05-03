//
//  WebViewVC.swift
//  Favorite Movies Exercise
//
//  Created by Sean Perez on 5/2/16.
//  Copyright © 2016 Sean Perez. All rights reserved.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {
    
    @IBOutlet weak var container: UIView!
    
    @IBAction func doneBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    var webView: UIWebView!
    
    var imdbLink: String?
    
    var imdbPage: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let theActress = imdbPage {
            imdbLink = theActress.link
        }
        
        webView = UIWebView()
        container.addSubview(webView)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
        
        let urlStr = imdbLink
        let url = NSURL(string: urlStr!)!
        let request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
    }
}
