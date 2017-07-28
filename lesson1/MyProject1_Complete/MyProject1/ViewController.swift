//
//  ViewController.swift
//  MyProject1
//

import UIKit

class ViewController: UIViewController {

    @IBAction func onButtonTap(_ sender: Any) {
        // テキストフィールドの内容を更新
        myTextField.text = "タップされました"
    }
    
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
