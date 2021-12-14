//
//  AddToDoViewController.swift
//  TodoList
//
//  Created by administrator on 13/12/2021.
//

import UIKit

class AddToDoViewController: UIViewController{

    var delegate: ToDoDelegate?
    var indexPath: NSIndexPath?
    
    @IBOutlet weak var datePiker: UIDatePicker!
    @IBOutlet weak var noteTextField: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
    }
    

    @IBAction func AddItemButtonPressed(_ sender: UIButton) {
        
        guard let title = titleTextField.text else {return}
        guard let note = noteTextField.text else {return}
      
        
        delegate?.addTodo(by: self, with: title, with: note, with: datePiker.date, at: indexPath)
       
        dismiss(animated: true, completion: nil)
    }
    
}


