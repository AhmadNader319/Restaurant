//
//  OrderConfirmationViewController.swift
//  Restaurant
//
//  Created by Ahmad Nader on 8/08/23.
//

import UIKit


class OrderConfirmationViewController: UIViewController {
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    var minutes: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        timeRemainingLabel.text = "Thanks for your order! the waiting time is almost \(minutes!) minutes"
    }



}
