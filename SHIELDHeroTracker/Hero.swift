//
//  Hero.swift
//  SHIELDHeroTracker
//
//  Created by Belén Molina del Campo on 25/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

import UIKit

class Hero {
    var name: String?
    var homeworld: String?
    var superpowers: String?
    var image: UIImage?
    
    init(dictionary: [String: AnyObject]) {
        
        if let name = dictionary["name"] as? String
        {
            self.name = name
        }
        
        if let homeworld = dictionary["homeworld"] as? String
        {
            self.homeworld = homeworld
        }
        
        if let superpowers = dictionary["powers"] as? String
        {
            self.superpowers = superpowers
        }
        
        if let imageName = dictionary["image"] as? String
        {
            self.image = UIImage(named: imageName)
        }
    }
}
