//
//  ViewController.swift
//  TODOList
//
//  Created by Luis Isaac Maya Estrada on 10/01/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    
    var itemArray = [Item]()
    let dataFielPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
    }
    
    
    
    
    
/// MARK - tableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
        
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    
    
    
    
    
    
/// MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        
        
    tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
// MARK - add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Agregar nueva Lista", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Agregar Lista", style: .default) { (action) in
            // lo que pasara cuando el usuario quiera agregar algo
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
           self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "crear  nueva lista"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
/// MARK - Save Function
    
    func saveItems()  {
        let encoder = PropertyListEncoder()
        
        do{
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFielPath!)
        }
        catch{
            print("error encoding \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadItems(){
        
        if let data = try? Data(contentsOf: dataFielPath!){
            let decoder = PropertyListDecoder()
            do{
            itemArray = try decoder.decode([Item].self, from: data)
        }
            catch{
                print("error decoding \(error)")
            }
        }
    }



}

