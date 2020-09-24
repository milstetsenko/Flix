//
//  ViewController.swift
//  Flix
//
//  Created by Milana Stetsenko on 9/19/20.
//  Copyright © 2020 CodePath. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var movies = [[String:Any]]()

    @IBOutlet weak var MoviesTableView: UITableView!
    var users : [[String: Any]] = [["name":"Tim", "hometown": "Flo", "passion":"Hamjing"], ["name" : "Milana", "hometown":"Shostka"], ["name":"Dzvinka", "hometown":"Lviv"]]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            //print(dataDictionary)
            self.movies = dataDictionary["results"] as! [[String:Any]]
              // TODO: Reload your table view data
            self.MoviesTableView.reloadData()
           }
        }
        task.resume()
        MoviesTableView.dataSource = self
        MoviesTableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        // Get the index path from the cell that was tapped
        let indexPath = MoviesTableView.indexPathForSelectedRow
        // Get the Row of the Index Path and set as index
        let index = indexPath?.row
        // Get in touch with the DetailViewController
        let detailViewController = segue.destination as! DetailViewController
        // Pass on the data to the Detail ViewController by setting it's indexPathRow value
        detailViewController.index = index
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserCell
        let movie = movies[indexPath.row]
        let title = movie["title"]
        let synopsis = movie["overview"] as? String
        cell.NameCell!.text = title as? String
        cell.DescriptionLabel!.text = synopsis
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL (string: baseURL+posterPath)
        
        cell.PosterView.af_setImage(withURL: posterUrl!)
        
        return cell
    }
}

