//
//  tableViewController.swift
//  API-Sandbox
//
//  Created by Nathan Baker on 6/24/17.
//  Copyright © 2017 Make School. All rights reserved.
//
import Alamofire
import Foundation
import SwiftyJSON
import UIKit
import AlamofireImage
import AlamofireNetworkActivityIndicator

class TableViewController: UITableViewController {
    var movies = [Movie]()
    var row: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.movies = exerciseThree()
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! MovieTableViewCell
        
        let row = indexPath.row
        
        let movie = self.movies[row]
        
        cell.movieTitleLabel.text = movie.name
        cell.moviePriceLabel.text = "$\(movie.price)"
        
        return cell
    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.row = indexPath.row
//        print(indexPath.row)
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1
        self.row = self.tableView.indexPathForSelectedRow?.row
        if let identifier = segue.identifier {
            // 2
            if identifier == "displayMovie" {
                // 3
                print("Transitioning to the Display Movie View Controller")
            }
        }
        let viewController = segue.destination as! ViewController
        if let movieRow = self.row {
            viewController.movie = self.movies[movieRow]
        }
        
        
    }
    @IBAction func unwindToTableViewController(_ segue: UIStoryboardSegue) {

        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
}

