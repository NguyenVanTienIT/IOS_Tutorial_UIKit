//
//  ViewController.swift
//  IOS_Tutorial_UIKit
//
//  Created by tiennv2 on 22/07/2022.
//

import UIKit

class ViewController: UIViewController {

    var aphal: Float?
    var beta: Float?
    var navController: UINavigationController?
    
    @IBOutlet weak var result: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func handleTouchOutside(_ sender: UITextField) {
        
    }
    
    
    @IBAction func handleTouchOutsideBeta(_ sender: UITextField) {
        
    }
    
    @IBAction func handleOnChangeAphal(_ sender: UITextField) {
         aphal = Float(sender.text ?? "0")
         print(sender.text ?? "nil")
    }
    
    
    @IBAction func handleOnChangeBeta(_ sender: UITextField) {
         beta = Float(sender.text ?? "0")
         print(sender.text ?? "nil")
    }
    
    @IBAction func handlePressButton(_ sender: Any) {
        if aphal != nil && beta != nil {
            result.text = "This is result \(aphal! * 0.4 + beta! * 0.6)"
        }
    }
    
    @IBAction func handleNavigate(_ sender: Any) {
        let alert = UIAlertController(title: "Navigate Todo List", message: "Do you want navigate to Todo List?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
            self.handleNavigateTodoList()
        }))
        self.present(alert, animated: true)
    
    }
    
    func handleNavigateTodoList() {
        performSegue(withIdentifier: "navigateToTodoList", sender: nil)
//        let currentScreen = self.storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
//        let todoListViewControler = self.storyboard?.instantiateViewController(withIdentifier: "todoList") as! ToDoListViewController
//        currentScreen.navigationController?.pushViewController(todoListViewControler, animated: true)
    }
}
