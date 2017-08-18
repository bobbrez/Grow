//
//  Food.swift
//  Grow
//
//  Created by Bob Breznak on 8/18/17.
//  Copyright © 2017 Bob Breznak. All rights reserved.
//

import UIKit

class Food {
    // MARK: Properties
    
    var name: String
    var image: UIImage?
    var raiting: Int
    
    // MARK: Initialization
    init?(name: String, image: UIImage?, raiting: Int) {
        self.name = name
        self.image = image
        self.raiting = raiting
        
        if name.isEmpty || raiting < 0 {
            return nil
        }
    }
    
}
