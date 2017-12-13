//
//  TableViewController.swift
//  CarSale
//
//  Created by Darius Igna on 11/2/17.
//  Copyright © 2017 Darius Igna. All rights reserved.
//

import UIKit
import os.log

let kAnouncementsSave = "kAnouncementsSave"

protocol AnnouncementDelegate: class{
    func changed(ann: Announcement!)
    func add(ann: Announcement!)
}

class TableViewController: UITableViewController, AnnouncementDelegate {
    func add(ann: Announcement!) {
        self.announcements.append(ann)
        self.tableView.reloadData()
        self.saveAnnouncements()
    }
    
    
    func changed(ann: Announcement!) {
        let index = self.tableView.indexPathForSelectedRow
        if(index != nil)
        {
            self.announcements[(index?.row)!] = ann
            self.tableView.reloadData()
            saveAnnouncements()
        }
    }
    
    private func saveAnnouncements(){
        var datas = [Data]()
        for announcement in announcements {
            let data = NSKeyedArchiver.archivedData(withRootObject: announcement)
            datas.append(data)
        }
        
        UserDefaults.standard.setValue(datas, forKey: kAnouncementsSave)
    }
    
    private func loadAnnouncements() -> [Announcement]  {
        if let data = UserDefaults.standard.object(forKey: kAnouncementsSave) as? [Data] {
            var datas = [Announcement]()
            for item in data {
                let announcementData = NSKeyedUnarchiver.unarchiveObject(with: item)
                datas.append(announcementData as! Announcement)
            }
            
            return datas
        }
        
        return []
    }
    
    
    
    var announcements = [Announcement]()
    
    func loadAnnouncements1()
    {
        let photo1 = UIImage(named: "car1")
        let photo2 = UIImage(named: "car2")
        let photo3 = UIImage(named: "car3")
        guard let a1 = Announcement(id: 1, date: Date(), image: photo1!,
                                    title: "Audi A4",userID: 1,
                                    descriptionn:"Audi A4 din 2005 Navi Full Option",
                                    price: 5000,
                                    location:"Cluj-Napoca" )
            else {
                fatalError("Unable to instantiate anoumcement1")
        }
        
        guard let a2 = Announcement(id: 2, date: Date(), image: photo2!,
                                    title: "BMW 320D",userID: 1,
                                    descriptionn:"BMW 320D Automatic 2006 accident-free",
                                    price: 5400,
                                    location:"Cluj-Napoca" )
            else {
                fatalError("Unable to instantiate anoumcement1")
        }
        
        guard let a3 = Announcement(id: 3, date: Date(), image: photo3!,
                                    title: "Dacia Logan",userID: 1,
                                    descriptionn:"Dacia Logan 2008 leather, navigation",
                                    price: 6000,
                                    location:"Cluj-Napoca" )
            else {
                fatalError("Unable to instantiate anoumcement1")
        }
        
        announcements+=[a1, a2, a3]

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add",
                                                                 style: UIBarButtonItemStyle.plain, target: self, action: #selector(createAnn(item:)))
        
        navigationItem.leftBarButtonItem = editButtonItem
        
//        let saved = loadAnnouncements()
//        announcements += saved
        if announcements.isEmpty
        {
            // Load the sample data.
            loadAnnouncements1()
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AnnouncementViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AnnouncementViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let announcement = announcements[indexPath.row]
        
        cell.titleLabel.text = announcement.title
        cell.carImageView.image = announcement.image
        cell.locationLabel.text = announcement.location
        cell.priceLabel.text = announcement.price.description + "€"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        
        cell.dateLabel.text = dateFormatter.string(for: announcement.date)
        
        return cell
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return announcements.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails"
        {
            if let destinationVC = segue.destination as? CarDetailsViewController {
                destinationVC.ann = self.announcements[(self.tableView.indexPathForSelectedRow?.row)!]
                destinationVC.delegate = self
            }
        }
        else if segue.identifier == "addView"
        {
            if let destinationVC = segue.destination as? AddViewController {
                destinationVC.delegate = self
            }
        }
        
    }
    
    func getPrices()->[Int]{
        var prices = [Int]()
        for ann in announcements {
            prices.append(ann.price)
        }
        return prices
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    @objc fileprivate func createAnn(item: UIBarButtonItem){
        performSegue(withIdentifier: "addView", sender: self)
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            announcements.remove(at: indexPath.row)
            saveAnnouncements()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        // Toggles the edit button state
        super.setEditing(editing, animated: animated)
        // Toggles the actual editing actions appearing on a table view
        tableView.setEditing(editing, animated: true)
        navigationItem.rightBarButtonItem?.isEnabled = !(navigationItem.rightBarButtonItem?.isEnabled)!
    }

    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
