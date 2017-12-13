//
//  AddViewController.swift
//  CarSale
//
//  Created by Darius Igna on 12/6/17.
//  Copyright © 2017 Darius Igna. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleEdit: UITextField!
    @IBOutlet weak var priceEdit: UITextField!
    @IBOutlet weak var locationEdit: UITextField!
    @IBOutlet weak var descriptionEdit: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addImageButton: UIButton!
    var ann = Announcement()
    
    let imagePicker = UIImagePickerController()
    
    weak var delegate: TableViewController!
    override func viewDidLoad(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                                 style: UIBarButtonItemStyle.plain, target: self, action: #selector(saveTapped(item:)))
        super.viewDidLoad()
        
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        descriptionEdit!.layer.borderWidth = 1
        descriptionEdit!.layer.borderColor = UIColor.black.cgColor

        // Do any additional setup after loading the view.
    }
    
    @objc fileprivate func saveTapped(item: UIBarButtonItem){
        if(titleEdit.text!.isEmpty || descriptionEdit.text!.isEmpty || priceEdit.text!.isEmpty || locationEdit.text!.isEmpty){
            let alert = UIAlertController(title: "Alert", message: "Fields cannot be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        ann.title = titleEdit.text!
        ann.descriptionn = descriptionEdit.text!
        ann.price = Int(priceEdit.text!)!
        ann.location = locationEdit.text!
        if (imageView.image != nil)
        {
            ann.image = imageView.image!
        } else {
            ann.image = UIImage()
        }
        self.delegate.add(ann: ann)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func addImage(_ sender: Any) {
            imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.image = pickedImage
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        
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
