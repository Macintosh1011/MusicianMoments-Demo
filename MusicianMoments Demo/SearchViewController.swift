//
//  SearchViewController.swift
//  MusicianMoments Demo
//
//  Created by Idan Kestenbom on 10/31/23.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UISearchBarDelegate {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var field: UISearchBar!
    
    var data = [String]()
    var filteredData = [String]()
    var filtered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "YourCellIdentifier")
        
        setupData()
        table.delegate = self
        table.dataSource = self
        field.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            filterText(text + string)
            return true
        }
        return false
    }
    
    func filterText(_ query: String?) {
        filteredData.removeAll()
        for string in data {
            if string.lowercased().starts(with: query?.lowercased() ?? "") {
                filteredData.append(string)
            }
        }
        table.reloadData()
        filtered = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterText(searchText)
    }
    
    
    func setupData() {
        data.append("John")
        data.append("Abe")
        data.append("Idan")
        data.append("Dan")
        data.append("Zach")
        data.append("Luke")
        data.append("Kevin")
        data.append("Briana")
        data.append("Melenie")
        data.append("Sarah")
        data.append("Shawn")
        data.append("Teri")
        data.append("Tom")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filtered {
            return filteredData.count
        } else {
            return data.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YourCellIdentifier", for: indexPath)
        
        if filtered {
            if indexPath.row < filteredData.count {
                cell.textLabel?.text = filteredData[indexPath.row]
            }
        } else {
            if indexPath.row < data.count {
                cell.textLabel?.text = data[indexPath.row]
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedUser = ""
        
        
        switch indexPath.item {
    case 1:
        selectedUser = "Idan"
    case 2:
        selectedUser = "Mahati"
    case 3:
        selectedUser = "Aaron"
    case 4:
        selectedUser = "Aadit"
    case 5:
        selectedUser = "Mishali"
    case 6:
        selectedUser = "Vansh"
    default:
        selectedUser = ""
    }
    
    
        let vc = GenericProfile()
        vc.selecteduserr = selectedUser
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
    
}
