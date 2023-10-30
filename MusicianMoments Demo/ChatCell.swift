//
//  DmsViewController.swift
//  MusicianMoments Demo
//
//  Created by Mishali Pandey on 10/29/23.
//
import UIKit

class ChatCell: UITableViewCell {
    @IBOutlet var senderNameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel
}
import UIKit

class ChatViewController: UITableViewController {

    let messages = [
        ("Sender1", "Hello!"),
        ("You", "Hi there!"),
        // Add more mock messages as needed
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell

        let (sender, message) = messages[indexPath.row]
        cell.senderNameLabel.text = sender
        cell.messageLabel.text = message

        return cell
    }
}
