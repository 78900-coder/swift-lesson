//
//  DetailViewController.swift
//  MyProject3
//
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
   
    var imageName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // imageNameのnilチェック
        guard let myImageName = imageName else
        {
            // imageNameがnilならば、処理をキャンセル
            return
        }
        
        detailImageView.image = UIImage(named: myImageName)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
