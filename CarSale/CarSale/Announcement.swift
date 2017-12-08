//
//  Announcement.swift
//  CarSale
//
//  Created by Darius Igna on 11/2/17.
//  Copyright © 2017 Darius Igna. All rights reserved.
//

import Foundation
import UIKit
import os.log

//MARK: Archiving Paths



struct PropertyKey {
    static let id = "id"
    static let date = "date"
    static let image = "image"
    static let userID = "UserID"
    static let descriptionn = "description"
    static let location = "location"
    static let price = "price"
    static let title = "title"
}

class Announcement: NSObject, NSCoding{
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("announcements")
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: PropertyKey.id)
        aCoder.encode(date, forKey: PropertyKey.date)
        aCoder.encode(image, forKey: PropertyKey.image)
        aCoder.encode(userID, forKey: PropertyKey.userID)
        aCoder.encode(descriptionn, forKey: PropertyKey.descriptionn)
        aCoder.encode(location, forKey: PropertyKey.location)
        aCoder.encode(price, forKey: PropertyKey.price)
        aCoder.encode(title, forKey: PropertyKey.title)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard (aDecoder.decodeObject(forKey: PropertyKey.title) as? String) != nil else {
            os_log("Unable to decode the title for a Announcement object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let date = aDecoder.decodeObject(forKey: PropertyKey.date)
        let image = aDecoder.decodeObject(forKey: PropertyKey.image)
        let title = aDecoder.decodeObject(forKey: PropertyKey.title)
        let descriptionn = aDecoder.decodeObject(forKey: PropertyKey.descriptionn)
        let location = aDecoder.decodeObject(forKey: PropertyKey.location)
        let id = aDecoder.decodeInteger(forKey: PropertyKey.id)
        let userID = aDecoder.decodeInteger(forKey: PropertyKey.userID)
        let price = aDecoder.decodeInteger(forKey: PropertyKey.price)
        
        self.init(id: id,date: date as! Date,image: image as! UIImage,title: title as! String,userID: userID,descriptionn: descriptionn as! String,price: price,location: location as! String)
    }
    
    
    var id: Int
    var date: Date
    var image: UIImage?
    var title: String
    var userID: Int
    var descriptionn: String
    var location: String
    var price: Int
    
    override init() {
        self.id = -1
        self.date = Date()
        self.image = nil
        self.title = ""
        self.userID = -1
        self.descriptionn = ""
        self.location = ""
        self.price = -1
    }
    
    init?(id: Int, date: Date, image: UIImage, title: String, userID: Int, descriptionn: String,
          price: Int, location: String)
    {
        if id < 0 || date > Date() ||
        title.isEmpty || userID < 0 || descriptionn.isEmpty
        {
            return nil
        }
        self.id = id
        self.date = date
        self.image = image
        self.title = title
        self.userID = userID
        self.descriptionn = descriptionn
        self.location = location
        self.price = price
    }
}
