//
//  詳細画面
//  DetailImageView.swift
//  MyProject5
//

import UIKit

class DetailImageView: UIViewController {

    /// 詳細イメージビュー
    @IBOutlet weak var detailImageView: UIImageView!

    /// 一覧画面から受け取る画像情報
    var detailImage:UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
