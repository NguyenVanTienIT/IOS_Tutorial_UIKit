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
    
    @IBOutlet weak var result: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
}

