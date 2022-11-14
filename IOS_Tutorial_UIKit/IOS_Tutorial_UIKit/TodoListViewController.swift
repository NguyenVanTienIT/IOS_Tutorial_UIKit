//
//  TodoListViewController.swift
//  IOS_Tutorial_UIKit
//
//  Created by tien.nguyen23 on 08/11/2022.
//

import Foundation
import UIKit
class ToDoListViewController: UIViewController {
    
    override func viewDidLoad() {
       setLayoutHeader()
    }
    
    func setLayoutHeader() {
        let buttonAdd = UIBarButtonItem(title: "Add", style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleAddItemTodo(sender:)))
        navigationItem.setRightBarButton(buttonAdd, animated: true)
    }
    
    @objc func handleAddItemTodo(sender: UIBarButtonItem) {
        print("AAA")
    }
}
