//
//  GeneraTableViewCell.swift
//  module 4
//
//  Created by kyaw htet aung on 2021/04/17.
//

import UIKit

class GenreTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewGenre: UICollectionView!
    @IBOutlet weak var colleactionViewMovie: UICollectionView!
    
    let genreList = [GenreVO(name: "ACTION", isSelected: true),GenreVO(name: "DREMA", isSelected: false),GenreVO(name: "AVENTURE", isSelected: false),GenreVO(name: "HORROR", isSelected: false),GenreVO(name: "SCERRY", isSelected: false)]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionViewGenre.dataSource = self
        collectionViewGenre.delegate = self
        
        collectionViewGenre.register(UINib(nibName: String(describing: GenreCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: GenreCollectionViewCell.self))
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension GenreTableViewCell : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genreList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GenreCollectionViewCell.self), for: indexPath) as? GenreCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.data = genreList[indexPath.row]
        cell.onTapItem = { genreName in
            self.genreList.forEach{(GenreVO) in
                if genreName == GenreVO.name{
                    GenreVO.isSelected = true
                }else{
                        GenreVO.isSelected = false
                    }
            }
            self.collectionViewGenre.reloadData()
        }
        
        return cell
        
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: widthOfString(text: genreList[indexPath.row].name, font: UIFont(name: "Geeza Pro Regular", size: 14) ?? UIFont.systemFont(ofSize: 14))+20, height: 45)
    }
    
    func widthOfString(text:String, font:UIFont) -> CGFloat{
        let fontAttributes = [NSAttributedString.Key.font : font]
        let textSize = text.size(withAttributes: fontAttributes)
        return textSize.width
    }
    
    
}
