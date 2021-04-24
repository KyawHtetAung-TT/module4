//
//  MovieSliderTableViewCell.swift
//  module 4
//
//  Created by kyaw htet aung on 2021/04/13.
//

import UIKit

class MovieSliderTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewMovie: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionViewMovie.dataSource = self
        collectionViewMovie.delegate = self
        
        collectionViewMovie.register(UINib(nibName: String(describing: MovieSliderCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MovieSliderCollectionViewCell.self))
        
        
        
        collectionViewMovie.dataSource = self
        collectionViewMovie.delegate = self
        
        collectionViewMovie.register(UINib(nibName: String(describing: MovieSliderCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MovieSliderCollectionViewCell.self))
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MovieSliderTableViewCell: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MovieSliderCollectionViewCell.self), for: indexPath) as? MovieSliderCollectionViewCell else {
            return MovieSliderCollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: CGFloat(210))
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    
}
