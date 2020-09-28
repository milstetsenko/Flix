//
//  DetailViewController.swift
//  Flix
//
//  Created by Milana Stetsenko on 9/21/20.
//  Copyright © 2020 CodePath. All rights reserved.
//

import UIKit
import AlamofireImage
class DetailViewController: UIViewController {
    

    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var FrontdropImage: UIImageView!
    @IBOutlet weak var Titlelabel: UILabel!
    @IBOutlet weak var Synopsislabel: UILabel!
    
    
    var movie: [String:Any]!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Titlelabel.text = movie["title"] as? String
        Titlelabel.sizeToFit()
        Synopsislabel.text = movie["overview"] as? String
        Synopsislabel.sizeToFit()
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL (string: baseURL+posterPath)
    
        FrontdropImage.af_setImage(withURL: posterUrl!)
        
        
        let backdroppath = movie["backdrop_path"] as! String
        let backdropURL = URL (string: "https://image.tmdb.org/t/p/w780" + backdroppath)
        
        backdropImage.af_setImage(withURL: backdropURL!)
    }
    



}
