//
//  ViewController.swift
//  module 4
//
//  Created by kyaw htet aung on 2021/04/11.
//

import UIKit

class MovieViewController: UIViewController {

    
    @IBOutlet weak var viewForToolbar: UIView!
    @IBOutlet weak var ivMenu: UIImageView!
    @IBOutlet weak var ivSearch: UIImageView!
    @IBOutlet weak var tableViewMovie: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewMovie.dataSource = self
        tableViewMovie.register(UINib(nibName: String(describing: MovieSliderTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MovieSliderTableViewCell.self))
        
        tableViewMovie.register(UINib(nibName: String(describing:PopularFilmTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing:PopularFilmTableViewCell.self))
        
        tableViewMovie.register(UINib(nibName: String(describing: MovieShowTimeTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MovieShowTimeTableViewCell.self))
        
        tableViewMovie.register(UINib(nibName: String(describing: GenreTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: GenreTableViewCell.self))
        
        
    }


}

extension MovieViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieSliderTableViewCell.self), for: indexPath) as? MovieSliderTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:PopularFilmTableViewCell.self), for: indexPath) as? PopularFilmTableViewCell else {
                return UITableViewCell()
            }
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieShowTimeTableViewCell.self), for: indexPath) as? MovieShowTimeTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GenreTableViewCell.self), for: indexPath) as? GenreTableViewCell else {
                return UITableViewCell()
            }
            return cell
            
        default:
            return UITableViewCell()
        }
        
        
    }
    
    
}
