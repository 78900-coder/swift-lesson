//
//  ViewController.swift
//  MyProject5
//
//


import UIKit
import Accounts
import Social

class ViewController: UIViewController {
    
    /// トップ画面に戻る
    @IBAction func returnTop(segue: UIStoryboardSegue) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        accessTwitterAccount()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /// 連携したツイッターアカウント
    var twitterAccount:ACAccount?

    /// Twitterアカウントと連携する処理
    func accessTwitterAccount() {

    }

    /// テキストフィールドのテキストが変更された時の処理
    @IBAction func onTextChange(_ sender: UITextField) {
        // テキストフィールドに入力されている文字を取得
        guard let inputText = sender.text else {
            return
        }
        
        
    }

    /// 検索した画像のURLリスト
    var imageURLList:[String] = []
    /// ツイートを検索する
    func searchTweet(targetText: String) {
        
    }
    
    /// 遷移直前に実行される関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
