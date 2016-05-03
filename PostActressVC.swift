//
//  PostActressVC.swift
//  Favorite Movies Exercise
//
//  Created by Sean Perez on 5/2/16.
//  Copyright © 2016 Sean Perez. All rights reserved.
//

import UIKit
import CoreData

class PostActressVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker: UIImagePickerController!
    
    @IBOutlet weak var actressImg: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var imdbLink: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        actressImg.layer.cornerRadius = 10.0
        actressImg.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }
    
    @IBAction func cancelBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addImageBtnPressed(sender: AnyObject) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        actressImg.image = image
    }
    
    @IBAction func postActressBtnPressed(sender: AnyObject) {
        if let actressName = nameTextField.text, let desc = descTextField.text, let img = actressImg.image, let link = imdbLink.text {
        
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let actress = Movie(entity: entity, insertIntoManagedObjectContext: context)
            
            actress.title = actressName
            actress.desc = desc
            actress.setMovieImage(img)
            actress.link = link
            
            context.insertObject(actress)
            
            do {
                try context.save()
            } catch {
                print("Could not save post")
            }
            
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
