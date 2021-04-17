//
//  RatingControl.swift
//  module 4
//
//  Created by kyaw htet aung on 2021/04/14.
//

import UIKit

@IBDesignable
class RatingControl: UIStackView {
 
    @IBInspectable var rating : Int = 3{
        didSet{
           
            updateButtonRating()
        }
    }
    @IBInspectable var starCount : Int = 5{
        didSet{
            setupButton()
            updateButtonRating()
        }
    }
    @IBInspectable var starSize : CGSize = CGSize(width: 50.0, height: 50.0){
        didSet{
            setupButton()
            updateButtonRating()
        }
    }
    
    var ratingButton = [UIButton]()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        updateButtonRating()
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
        updateButtonRating()
        
    }
    
    private func setupButton(){
        
    clearExistingButton()
        
        for _ in 0..<starCount {
        
            let button = UIButton()
        
            button.setImage(UIImage(named: "filledstar"), for: .selected)
            button.setImage(UIImage(named: "emptystar"), for: .normal)
        
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
           
            button.isUserInteractionEnabled = false
            addArrangedSubview(button)
            
            ratingButton.append(button)
            
        }
     
    }
    
    private func updateButtonRating(){
        for (index,button) in ratingButton.enumerated(){
            button.isSelected = index < rating
            
        }
    
    }
    private func clearExistingButton(){
        for button in ratingButton {
            removeArrangedSubview(button)
            button.removeFromSuperview()
            ratingButton.removeAll()
        }
//        ratingButton.removeAll()
    }
}



