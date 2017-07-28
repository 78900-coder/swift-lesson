//
//  ViewController.swift
//  MyProject2
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    // 左端のボタンをタップしたら、image1の画像を表示する
    @IBAction func onTapButton1(_ sender: Any) {
         myImageView.image = UIImage(named: "image1")
    }
    
    // 中央のボタンをタップしたら、image2の画像を表示する
    @IBAction func onTapButton2(_ sender: Any) {
        myImageView.image = UIImage(named: "image2")
    }
    
    // 右端のボタンをタップしたら、image3の画像を表示する
    @IBAction func myImageViewimageUIImagenamedimage1onTapButton3(_ sender: Any) {
             myImageView.image = UIImage(named: "image3")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // myImageView.image = UIImage(named: "image3")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


