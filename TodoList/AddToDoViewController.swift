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
        
//        let formate  = datePiker.date.toString(withFormat: "yyyy-MM-dd HH:mm:ss") // Set output formate
//        guard let formatedDated = formate.toDate(withFormat: "yyyy-MM-dd HH:mm:ss") else {return}
        delegate?.addTodo(by: self, with: title, with: note, with: datePiker.date, at: indexPath)
       
        dismiss(animated: true, completion: nil)
    }
    
}

extension String {

    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss")-> Date?{

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date

    }
}

extension Date {

    func toString(withFormat format: String = "EEEE ، d MMMM yyyy") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
}
