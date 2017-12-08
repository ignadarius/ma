//
//  EditDetailsViewController.swift
//  CarSale
//
//  Created by Darius Igna on 11/10/17.
//  Copyright © 2017 Darius Igna. All rights reserved.
//

import UIKit

class EditDetailsViewController: ViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    public var ann: Announcement = Announcement()
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                                style: UIBarButtonItemStyle.plain, target: self, action: #selector(saveTapped(item:)))
        titleTextField.text = ann.title
        priceTextField.text = ann.price.description
        locationTextField.text = ann.location
        descriptionTextView.text = ann.descriptionn
        
        descriptionTextView!.layer.borderWidth = 1
        descriptionTextView!.layer.borderColor = UIColor.black.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    @objc fileprivate func cancelTapped(item: UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func saveTapped(item: UIBarButtonItem){
        let carDetailsController = storyboard?.instantiateViewController(withIdentifier: "carDetails") as! CarDetailsViewController
        ann.title = titleTextField.text!
        ann.descriptionn = descriptionTextView.text!
        ann.price = Int(priceTextField.text!)!
        ann.location = locationTextField.text!
        carDetailsController.ann = self.ann
        self.navigationController?.popViewController(animated: true)
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
