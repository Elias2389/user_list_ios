//
//  ViewController.swift
//  UserList
//
//  Created by Andres Rivas on 25/02/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var users = [User]()
    var selectdItem: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }


    func addPost(_ sender: UIBarButtonItem) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passSeque" {
            let detail = segue.destination as! DetailViewController
            detail.user = selectdItem
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectdItem = users[indexPath.row]
        return indexPath
    }
    
}


extension ViewController {
    func fetchData() {
        let url: String = "https://jsonplaceholder.typicode.com/users"
        
        AF.request(url).responseDecodable(of: [User].self) { response in
            debugPrint(response)
            guard let values = response.value else { return }
            self.users = values
            self.tableView.reloadData()
        
        }
    }
}

