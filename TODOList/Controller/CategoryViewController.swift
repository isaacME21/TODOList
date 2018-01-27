//
//  CategoryViewController.swift
//  TODOList
//
//  Created by Luis Isaac Maya Estrada on 17/01/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    
    var categoryArray : Results<Category>?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()

    
    }

  
    
    
    
    //MARK: - TableView DatasourceMethods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categoryArray?[indexPath.row].name ?? "No hay categorias"
        
        return cell
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray?.count ?? 1
    }
    
    
    
    //MARK: - Data Manipulation Methods
    
    func save(Category : Category)  {
        do{
            try realm.write {
                realm.add(Category)
            }
        }
        catch{
            print("error saving context \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories(){
        categoryArray = realm.objects(Category.self)
        tableView.reloadData()
    }
    
    
    
      //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            
            destinationVC.selectedCategory = categoryArray?[indexPath.row]
        }
    }
    
    
    
    
    
    
    //MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Agregar Nueva Categoria", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Agregar Categoria", style: .default) { (action) in
            // lo que pasara cuando el usuario quiera agregar algo
            
            
            let newCategory = Category()
            newCategory.name = textField.text!
        
            
            self.save(Category: newCategory)
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Crear  Nueva Categoria"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    
        
    }
    
    
    
    
}

