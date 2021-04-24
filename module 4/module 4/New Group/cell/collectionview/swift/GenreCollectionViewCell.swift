//
//  GeneraCollectionViewCell.swift
//  module 4
//
//  Created by kyaw htet aung on 2021/04/17.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var viewForOverlay: UIView!
    @IBOutlet weak var containerView: UIView!
    
    var onTapItem : ( (String) -> Void) = {_ in}
    
    var data: GenreVO? = nil{
        didSet{
            
            if let genre = data{
                lblGenre.text = data?.name
                (genre.isSelected) ? (viewForOverlay.isHidden = false) : (viewForOverlay.isHidden = true)
            }
            
//            lblGenre.text = data?.name
//            (data?.isSelected ?? false) ? (viewForOverlay.isHidden = false) : (               viewForOverlay.isHidden = true)
//
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let tapGestureForContainer = UITapGestureRecognizer(target: self, action: #selector(didTapItem))
        containerView.isUserInteractionEnabled = true
        containerView.addGestureRecognizer(tapGestureForContainer)
        
    }

    @objc func didTapItem(){
        onTapItem(data?.name ?? "")
        
    }
}
