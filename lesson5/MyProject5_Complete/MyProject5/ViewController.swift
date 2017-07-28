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
    var twitterAccount: ACAccount?

    /// Twitterアカウントと連携する処理
    func accessTwitterAccount() {

        let account = ACAccountStore()
        let accountType = account.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)

        // OSにSNSアカウントのリクエスト権限を求める
        account.requestAccessToAccounts(with: accountType, options: nil,
                completion: { granted, error in
                    // リクエストが拒否された時
                    if granted == false {
                        print("アプリへのアクセスが許可されなかった")
                        return;
                    }

                    // OSに登録されているアカウントの配列
                    let arrayOfAccounts: [Any]? = account.accounts(with: accountType)

                    // アカウントが存在しなければ処理をキャンセル
                    guard let accounts = arrayOfAccounts, accounts.count > 0 else {
                        print("Twitterのアカウントが存在しない")
                        return
                    }

                    // twitterAccountというメンバー変数にアカウント情報を保持しておく
                    self.twitterAccount = accounts[0] as? ACAccount

                    print("Twitterアカウントとの連携が成功した")
                })
    }

    /// テキストフィールドのテキストが変更された時の処理
    @IBAction func onTextChange(_ sender: UITextField) {
        // テキストフィールドに入力されている文字を取得
        guard let inputText = sender.text else {
            return
        }

        // 入力文字を元に検索を開始する
        searchTweet(targetText: inputText)
    }

    /// 検索した画像のURLリスト

    var imageURLList: [String] = []
    /// ツイートを検索する
    func searchTweet(targetText: String) {
        // ツイッターアカウントが存在しなければreturn
        guard let account = twitterAccount else {
            return
        }

        // SLRequestをインスタンス化
        let slRequest = SLRequest(
                forServiceType: SLServiceTypeTwitter, // SNSのタイプをTwitterに
                requestMethod: .GET, // 通信はGET
                url: URL(string: "https://api.twitter.com/1.1/search/tweets.json"), // APIのURLを指定
                parameters: [// パラメーターの設定
                             "q": targetText + " filter:images filter:safe exclude:retweets min_faves:1",
                             "count": "100"
                ]
        )

        // SLRequestが存在しなければキャンセル
        guard let request = slRequest else {
            return
        }

        // SLRequestとツイッターアカウントを紐付ける
        request.account = account

        // API通信を開始する
        request.perform(handler: { data, response, error in
            // エラーだったら処理をキャンセル
            if (error != nil) {
                print("通信エラーのため、キャンセル")
                return
            }

            // JSONデータの初期化
            let json = JSON(data: data!)

            // ツイートの配列が存在しなければキャンセル
            guard let tweetArray = json["statuses"].array else {
                return
            }

            // 画像のURLの配列を初期化
            self.imageURLList = []

            // ツイートの配列についてループ
            for tweet in tweetArray {
                // 画像URLを取得
                if let imageURL = tweet["entities"]["media"][0]["media_url_https"].string {
                    print(imageURL)
                    self.imageURLList.append(imageURL)
                }
            }

            // 「segueForImageList」を用いて、一覧画面に遷移する
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "segueForImageList", sender: nil)
            }
        })
    }

    /// 遷移直前に実行される関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 遷移先のDetailViewControllerを取得
        let imageListController = segue.destination as! ImageListController
        // ImageListControllerにimageListを渡す
        imageListController.imageList = imageURLList
    }
}
