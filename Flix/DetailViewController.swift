//
//  DetailViewController.swift
//  Flix
//
//  Created by Milana Stetsenko on 9/21/20.
//  Copyright © 2020 CodePath. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    

    @IBOutlet weak var DetailLabel: UILabel!
    
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailLabel.text = ("You tapped the cell at index \(String(index))")
                // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
