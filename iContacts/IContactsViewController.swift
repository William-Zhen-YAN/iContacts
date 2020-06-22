//
//  IContactsViewController.swift
//  iContacts
//
//  Created by Zhen YAN on 2020/06/22.
//  Copyright © 2020 Zhen YAN. All rights reserved.
//

import UIKit

class IContactsViewController: UITableViewController {
    
    var itemArray = [String]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let item = defaults.array(forKey: K.defaultKey) as? [String] {
            itemArray = item
        }
        
    }
    
    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for:indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark ? .none : .checkmark
        tableView.deselectRow(at: indexPath, animated: true)
        
        print(indexPath.row)
    }
    
    //MARK: - Add New Contacts
    @IBAction func addButtonPresed(_ sender: UIBarButtonItem) {
        var nameFiled = UITextField()
        var numberFiled = UITextField()
        
        let alert = UIAlertController(title: K.Alert.title, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: K.Alert.button, style: .default) { (action) in
            // what will happen once the user clicks the  Add Item button on our UTAlter
            
            self.itemArray.append(nameFiled.text ?? "")
            self.itemArray.append(numberFiled.text ?? "")
            
            self.defaults.set(self.itemArray, forKey: K.defaultKey)
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = K.Alert.addName
            nameFiled = alertTextField
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = K.Alert.addPhoneNumber
            numberFiled = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

