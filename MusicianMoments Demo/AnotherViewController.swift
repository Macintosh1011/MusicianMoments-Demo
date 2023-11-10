//
//  File.swift
//  MusicianMoments Demo
//
//  Created by Idan Kestenbom on 11/9/23.
//

import UIKit

class AnotherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Array to hold data for the table view
    let tableData = ["Row 1", "Row 2", "Row 3", "Row 4"]

    // Table view
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // Big image view
    let bigImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        // Set your big image here
        imageView.image = UIImage(named: "bigImage")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a horizontal stack view
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fill
        horizontalStackView.alignment = .center
        horizontalStackView.spacing = 20

        // Add the table view to the stack view
        horizontalStackView.addArrangedSubview(tableView)

        // Add the big image view to the stack view
        horizontalStackView.addArrangedSubview(bigImageView)

        // Add the stack view to the main view
        view.addSubview(horizontalStackView)

        // Constrain the stack view to the edges of the main view
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            horizontalStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            horizontalStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20)
        ])

        // Set up the table view
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCircleCell.self, forCellReuseIdentifier: "customCell")
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCircleCell

        // Customize the cell if needed

        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 // Adjust the height of the custom cell as needed
    }
}
