//
//  PostCell.swift
//  Favorite Movies Exercise
//
//  Created by Sean Perez on 5/2/16.
//  Copyright © 2016 Sean Perez. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var actressImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        actressImg.layer.cornerRadius = 10.0
        actressImg.clipsToBounds = true
        
    }
    
    func configureCell(post: Movie) {
        titleLbl.text = post.title
        descLbl.text = post.desc
        actressImg.image = post.getMovieImage()
    }
}
