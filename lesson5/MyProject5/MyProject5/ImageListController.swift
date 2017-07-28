//
//  画像一覧画面
//  ImageListController.swift
//  MyProject5
//

import UIKit
import Social

class ImageListController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /// トップ画面で取得した画像のURLの配列
    var imageList:[String]?

    /// トップ画面に戻る
    @IBAction func returnImageList(segue: UIStoryboardSegue) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// セクションの数を設定する
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /// セルの数を設定する
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        // imageListが存在しなければ処理をキャンセル
        guard let myImageList = imageList else {
            return 0
        }
        
        return myImageList.count
    }
    
    /// セルの内容を設定する
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        
        // セルのインデックスを取得
        let columnIndex = indexPath.row
        
        guard let myImageList = imageList else {
            return cell
        }
        
        // MyCollectionViewCellのimageに画像を設定
        cell.imageURL = myImageList[columnIndex]
        return cell
    }
    
    /// セルのサイズを設定する
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 横幅はコレクションビューのサイズの3分の1、さらにマージン分の引く
        let width = collectionView.frame.size.width / 3 - 2
        // 縦幅は横幅と同じ
        let height = width
        // サイズを示すCGSizeクラスとして返す
        return CGSize(width: width, height: height)
    }
    
    
    /// 遷移直前に実行される関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 遷移先が詳細画面の場合のみ処理を続行する
        if segue.destination is DetailImageView {
            // 遷移先のDetailImageViewを取得
            let detailImageView = segue.destination as! DetailImageView
            // タップされたセルを取得
            let tappedCell = sender as! MyCollectionViewCell
            // セル内で参照している画像が存在しない場合は処理をキャンセル
            guard let myImage = tappedCell.cellImage.image else {
                return
            }
            // 詳細画面の画像として、セルで参照している画像を渡す
            detailImageView.detailImage = myImage
        }
    }
}


