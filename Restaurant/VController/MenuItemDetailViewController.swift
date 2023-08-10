//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by Ahmad Nader on 8/08/23.

//

import UIKit

protocol AddToOrderDelegate {
    func added(menuItem: MenuItem)
}

class MenuItemDetailViewController: UIViewController {
    // Since the detail screen will never be presented without a MenuItem object in place, you can define the property as an implicitly unwrapped optional
    var menuItem: MenuItem!
    
    var delegate: AddToOrderDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setupDelegate()
    }

   
    
    func setupDelegate(){
        if let navController = tabBarController?.viewControllers?.last as? UINavigationController{
            if let orderTableViewController = navController.viewControllers.first as? OrderTableViewController{
                delegate = orderTableViewController
            }
        }
        
    }
    func updateUI(){
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        descriptionLabel.text = menuItem.description
        // addToOrderButton.layer.cornerRadius = 6.6
        addToOrderButton.layer.cornerRadius = 5.0
        
        MenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.4) {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        
        delegate?.added(menuItem: menuItem)
    }

}
