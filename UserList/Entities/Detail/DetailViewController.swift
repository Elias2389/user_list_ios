//
//  DetailViewController.swift
//  UserList
//
//  Created by Andres Rivas on 25/02/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleItem: UILabel!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleItem.text = user?.email

    }

}
