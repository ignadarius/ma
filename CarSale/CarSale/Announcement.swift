//
//  Announcement.swift
//  CarSale
//
//  Created by Darius Igna on 11/2/17.
//  Copyright © 2017 Darius Igna. All rights reserved.
//

import Foundation
import UIKit

class Announcement{
    
    var id: Int
    var date: Date
    var image: UIImage?
    var title: String
    var userID: Int
    var description: String
    var location: String
    var price: Int
    
    init() {
        self.id = -1
        self.date = Date()
        self.image = nil
        self.title = ""
        self.userID = -1
        self.description = ""
        self.location = ""
        self.price = -1
    }
    
    init?(id: Int, date: Date, image: UIImage, title: String, userID: Int, description: String,
          price: Int, location: String)
    {
        if id < 0 || date > Date() ||
        title.isEmpty || userID < 0 || description.isEmpty
        {
            return nil
        }
        self.id = id
        self.date = date
        self.image = image
        self.title = title
        self.userID = userID
        self.description = description
        self.location = location
        self.price = price
    }
}
