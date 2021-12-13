//
//  ToDoDelegate.swift
//  TodoList
//
//  Created by administrator on 13/12/2021.
//

import Foundation

protocol ToDoDelegate: AnyObject{
    
    func addTodo(by controller : AddToDoViewController,
                 with title:String,
                 with note:String, with date: Date,
                 at indexPth : NSIndexPath?)
}
