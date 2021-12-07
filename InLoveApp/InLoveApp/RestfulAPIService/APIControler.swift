//
//  APIControler.swift
//  InLoveApp
//
//  Created by Vu Thien on 04/12/2021.
//

import Foundation
import UIKit

class APIViewController : UIViewController {
    
    //init view
    var labelTable:UILabel!
    var movieTableView:UITableView!
    var loadingView:UIActivityIndicatorView!
    
    var moviesData:MoviewModel!
    
    var movieViewModel = MovieViewModel()
    var errorLoading:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPopularMovieView()
    }
    
    func loadDataTableView() {
        movieViewModel.initService()
        movieViewModel.fetchMoviesData { [weak self] (error) in
            if error == HAS_ERROR_CODE {
               //
            } else {
                DispatchQueue.main.async {
                    self?.movieTableView.delegate = self
                    self?.movieTableView.dataSource = self
                    self?.movieTableView.reloadData()
                }
            }
            self?.errorLoading = error
        }
    }
    
    func setupPopularMovieView() {
        
        //setting init Movie Label
        labelTable = UILabel.init(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: 50))
        labelTable.text = "Popular Movies"
        labelTable.textAlignment = .center
        labelTable.font = .boldSystemFont(ofSize: 25)
        labelTable.textColor = .systemTeal
        labelTable.backgroundColor = .black
        self.view.addSubview(labelTable)
        
        //setting init Movies Table
        self.movieTableView = UITableView.init(frame: CGRect(x: 0, y: 160, width: self.view.frame.width, height: self.view.frame.height - 160))
        self.movieTableView.register(TableViewCell.self, forCellReuseIdentifier: "MoviesCell")
        self.view.addSubview(self.movieTableView)
        
        loadDataTableView()
//        if self.errorLoading == HAS_ERROR_CODE {
            self.loadingView = UIActivityIndicatorView.init(frame: CGRect(x: 0, y: 160, width: self.view.frame.width, height: self.view.frame.height - 160))
            self.loadingView.startAnimating()
            self.view.willRemoveSubview(self.movieTableView)
            self.view.addSubview(self.loadingView)
//        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let api = segue.destination as? APISegueViewController {
            api.setMoviewData(moviesData)
        }
    }
}

extension APIViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModel.getNumberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesCell", for: indexPath) as! TableViewCell
        let data = movieViewModel.getMoviesInfoWith(index: indexPath)
        cell.setupViewCell(data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        moviesData = movieViewModel.getMoviesInfoWith(index: indexPath)
        self.performSegue(withIdentifier: "APISegueView", sender: nil)
    }
    
}
