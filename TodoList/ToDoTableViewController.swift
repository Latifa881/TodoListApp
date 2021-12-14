//
//  ViewController.swift
//  TodoList
//
//  Created by administrator on 13/12/2021.
//

import UIKit
import CoreData

class ToDoTableViewController: UITableViewController , ToDoDelegate {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var tasks = [ToDoEntity]()

    override func viewDidLoad() {
        super.viewDidLoad()
      
        fetchAllItems()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let addItemTableViewController = segue.destination as! AddToDoViewController
        addItemTableViewController.delegate = self

    }
    func fetchAllItems(){
            
            let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoEntity")
            do {
                let results = try managedObjectContext.fetch(itemRequest)
                tasks = results as! [ToDoEntity]
        
            } catch {
                print("\(error)")
            }
            tableView.reloadData()
        }
    
    func addTodo(by controller: AddToDoViewController, with title: String, with note: String, with date: Date, at indexPth: NSIndexPath?) {
        let thing = NSEntityDescription.insertNewObject(forEntityName: "ToDoEntity", into: managedObjectContext) as! ToDoEntity
        thing.title = title
        thing.note = note
        thing.dueDate = date
        
        tasks.append(thing)
        if managedObjectContext.hasChanges{
                    do {
                        try managedObjectContext.save()
                       
                    }catch{
                        print(error.localizedDescription)
                    }
                }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! ToDoTableViewCell
        
        cell.titleLabel.text = tasks[indexPath.row].title
        cell.noteLabel.text = tasks[indexPath.row].note
        

        let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .short
                dateFormatter.timeStyle = .medium
                let dateString = dateFormatter.string(from: tasks[indexPath.row].dueDate!)
        
        cell.dueDateLabel.text = dateString
     
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
               if cell.accessoryType == .checkmark {
                   cell.accessoryType = .none
               } else {
                   cell.accessoryType = .checkmark
               }
           }
           tableView.deselectRow(at: indexPath, animated: true)
       }


}

