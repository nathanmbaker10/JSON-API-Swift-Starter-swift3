//
//  ViewController.swift
//  API-Sandbox
//
//  Created by Dion Larson on 6/24/16.
//  Copyright © 2016 Make School. All rights reserved.
//
import Foundation
import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator

class ViewController: UIViewController {
    var movie: Movie?

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var rightsOwnerLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func viewDidLoad() {
        
//         Do any additional setup after loading the view, typically from a nib.
//         Do what you need to with JSON here!
//         The rest is all boiler plate code you'll use for API requests
        if let currentMovie = self.movie {
            self.title = currentMovie.name
            self.movieTitleLabel.text = currentMovie.name
            self.rightsOwnerLabel.text = currentMovie.rightsOwner
            self.releaseDateLabel.text = currentMovie.releaseDate
            self.priceLabel.text = "$\(String(describing: currentMovie.price))"
            self.loadPoster(urlString: (self.movie?.imageLink)!)
        }

        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "Back" {
                print("Back button pressed")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Updates the image view when passed a url string
    func loadPoster(urlString: String) {
        posterImageView.af_setImage(withURL: URL(string: urlString)!)
    }
    
    @IBAction func viewOniTunesPressed(_ sender: AnyObject) {
        UIApplication.shared.openURL(URL(string:(self.movie?.link)!)!)
    }
    
}

