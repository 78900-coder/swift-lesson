//
//  MyCollectionViewCell.swift
//  MyProject5
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImage: UIImageView!

    /// 画像のURL
    var imageURL: String?

    override func didMoveToWindow() {
        // imageURLが存在しない場合はキャンセル
        guard let myURL = imageURL else {
            print("MyCollectionViewCell: imageURLが存在しない")
            return
        }

        // URLRequestをインスタンス化
        let urlRequest = URLRequest(
                url: URL(string: myURL)!, // ★ URLの作成
                cachePolicy: .returnCacheDataElseLoad   // キャッシュを使う設定
        );

        // URLSessionをインスタンス化
        let session = URLSession(
                configuration: .default,
                delegate: nil,
                delegateQueue: .main);

        // データ通信を開始
        session.dataTask(with: urlRequest,
                completionHandler: { (data, response, error) in

                    if error != nil {
                        print("画像の読み込みに失敗");
                        return
                    }

                    // ★ 画像を設定する
                    self.cellImage.image = UIImage(data: data!)

                }).resume();
    }
}

