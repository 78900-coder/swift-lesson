//
//  ViewController.swift
//  MyProject3
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func returnToMain(segue:UIStoryboardSegue) {
    }
    
    /// 遷移直前に実行される関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 遷移先のDetailViewControllerを取得
        let detailViewController = segue.destination as! DetailViewController
        // タップされたボタン要素を取得
        let tappedButton = sender as! UIButton;
        // ボタンのタグを取得
        let buttonTag = tappedButton.tag
        // 詳細画面に表示する画像名を生成
        let detailImageName = "image" + String(buttonTag)
        // 詳細画面に画像名を渡す
        detailViewController.imageName = detailImageName
    }
    
}





