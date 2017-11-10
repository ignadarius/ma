//
//  CarDetailsViewController.swift
//  CarSale
//
//  Created by Darius Igna on 11/9/17.
//  Copyright © 2017 Darius Igna. All rights reserved.
//

import UIKit

class CarDetailsViewController: ViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var ann: Announcement = Announcement()
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit",
                                                                 style: UIBarButtonItemStyle.plain, target: self, action: #selector(editTapped(item:)))
        
        self.titleLabel.text = ann.title
        self.imageView.image = ann.image
        self.priceLabel.text = "Price:"+ann.price.description + "€"
        self.locationLabel.text = "Location:"+ann.location
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        self.dateLabel.text = "Date:" + dateFormatter.string(for: ann.date)!
        self.descriptionTextView.text = ann.description;


        // Do any additional setup after loading the view.
    }
    
    @objc fileprivate func editTapped(item: UIBarButtonItem) {
        let editViewController = storyboard?.instantiateViewController(withIdentifier: "editDetails") as! EditDetailsViewController
        editViewController.ann = self.ann
        navigationController?.pushViewController(editViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
