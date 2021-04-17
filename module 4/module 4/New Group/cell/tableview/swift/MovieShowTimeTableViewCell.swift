//
//  MovieShowTimeTableViewCell.swift
//  module 4
//
//  Created by kyaw htet aung on 2021/04/16.
//

import UIKit

class MovieShowTimeTableViewCell: UITableViewCell {

   
    @IBOutlet weak var lblSeeMore: UILabel!
    @IBOutlet weak var lblCheckMovieShowtimes: UILabel!
    @IBOutlet weak var viewForBackground: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        viewForBackground.layer.cornerRadius = 10
        viewForBackground.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner]
        
        let attributedString = NSMutableAttributedString.init(string: "SEE MORE")
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: attributedString.length))
        
        lblSeeMore.attributedText = attributedString
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
