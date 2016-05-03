//
//  Movie.swift
//  Favorite Movies Exercise
//
//  Created by Sean Perez on 5/1/16.
//  Copyright © 2016 Sean Perez. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movie: NSManagedObject {

    func setMovieImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getMovieImage() -> UIImage? {
        let img = UIImage(data: self.image!)
        return img
    }
}
