//
//  ViewController.swift
//  MyProject4
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /// セクションの数を設定する
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /// セルの内容を設定する
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }

    /// セルの内容を設定する
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        
        // セルのインデックスを取得
        let columnIndex = indexPath.row
        // 画像名を作成
        let imageName = "image" + String(columnIndex + 1)
        // MyCollectionViewCellのimageに画像を設定
        cell.cellImage.image = UIImage(named: imageName)
        
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



