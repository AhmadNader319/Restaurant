//
//  CategoryTableViewController.swift
//  Restaurant
//
//  Created by Ahmad Nader on 8/08/23.


import UIKit
import UserNotifications

class CategoryTableViewController: UITableViewController {
    
    
    var categories = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        MenuController.shared.fetchCategories{ (categories) in
            if let categories = categories {
                self.updateUI(with: categories)
            }
        }
        // getting the user's permission for notification
        initNotificationSetupCheck()
    }
    
   

    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCellIdentifier", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].capitalized

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuSegue"{
            let menuTableViewController = segue.destination as! MenuTableViewController
            let index = tableView.indexPathForSelectedRow!.row
            menuTableViewController.category = categories[index]
        }
    }
    func updateUI(with categories: [String]){
        DispatchQueue.main.async {
            self.categories = categories
            self.tableView.reloadData()
        }
    }
    // Notification Implimentation
    func initNotificationSetupCheck() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert])
        { (success, error) in
            if success {
                print("Permission Accepted")
            } else {
                print("No Notification")
            }
        }
    }
 

}
