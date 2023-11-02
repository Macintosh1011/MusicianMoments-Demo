//
//  NamesListViewController.swift
//  MusicianMoments Demo
//
//  Created by Mishali Pandey on 11/1/23.
//

import UIKit

class NamesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  
    @IBOutlet var myTable: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTable.delegate = self
        myTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "John Smith"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Show Chat 
        let vc = ChatViewController(with: "Sped In the Head")
        vc.title = "Chat"
        navigationController?.pushViewController(vc, animated: true)
    }

}
