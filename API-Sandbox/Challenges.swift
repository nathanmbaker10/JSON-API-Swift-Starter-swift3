//
//  Challenges.swift
//  API-Sandbox
//
//  Created by Dion Larson on 6/26/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation
import SwiftyJSON

internal func exerciseOne() {
    // This would normally be network calls that return `NSData`. We'll show you how to do those soon!
    // In this case, we are using a local JSON file.
    guard let jsonURL = Bundle.main.url(forResource: "Random-User", withExtension: "json") else {
        print("Could not find Random-User.json!")
        return
    }
    let jsonData = try! Data(contentsOf: jsonURL)
    
    
    // Enter SwiftyJSON!
    // userData now contains a JSON object representing all the data in the JSON file.
    // This JSON file contains the same data as the tutorial example.
    let userData = JSON(data: jsonData)
    
    // Alright, now we have a JSON object from SwiftyJSON containing the user data!
    // Let's save the user's first name to a constant!
    let firstName = userData["results"][0]["name"]["first"].stringValue
    // Do you see what we did there? We navigated down the JSON heirarchy, asked for "results",
    // then the first dictionary value of that array, then the dictionary stored in "name",
    // then the value stored in "first". We  then told it that we wanted the value as a string.
    
    /*
     
     Now it's your turn to get the rest of the values needed to print the following:
     
     "<first name> <last name> lives at <street name> in <city>, <state>, <post code>.
     If you want to contact <title>. <last name>, you can email <email address> or
     call at <cell phone number>."
     
     */
    let lastName = userData["results"][0]["name"]["last"].stringValue
    let location = userData["results"][0]["location"]
    let streetName = location["street"].stringValue
    let city = location["city"].stringValue
    let state = location["state"].stringValue
    let postCode = (location["postcode"]).stringValue
    let title = userData["results"][0]["name"]["title"].stringValue
    let emailAdress = userData["results"][0]["email"].stringValue
    let phone = userData["results"][0]["phone"].stringValue
    
    print("\(firstName) \(lastName) lives at \(streetName) in \(city), \(state), \(postCode). If you want to contact \(title). \(lastName), you can email \(emailAdress) or call at \(phone)")
}

internal func exerciseTwo() {
    // This would normally be network calls that return `NSData`. We'll show you how to do those soon!
    // In this case, we are using a local JSON file.
    guard let jsonURL = Bundle.main.url(forResource: "iTunes-Movies", withExtension: "json") else {
        print("Could not find Random-User.json!")
        return
    }
    let jsonData = try! Data(contentsOf: jsonURL)
    
    
    // Enter SwiftyJSON!
    // moviesData now contains a JSON object representing all the data in the JSON file.
    // This JSON file contains the same data as the tutorial example.
    let moviesData = JSON(data: jsonData)
    let topMovieData = moviesData["feed"]["entry"][0]
    // We save the value for ["feed"]["entry"][0] to topMovieData to pull out just the first movie's data
 
    let topMovie = Movie(json: topMovieData)
    
    // Uncomment this print statement when you are ready to check your code!
    
    print("The top movie is \(topMovie.name) by \(topMovie.rightsOwner). It costs $\(topMovie.price) and was released on \(topMovie.releaseDate). You can view it on iTunes here: \(topMovie.link)")
}

internal func exerciseThree() {
    // This would normally be network calls that return `NSData`. We'll show you how to do those soon!
    // In this case, we are using a local JSON file.
    guard let jsonURL = Bundle.main.url(forResource: "iTunes-Movies", withExtension: "json") else {
        print("Could not find iTunes-Movies.json!")
        return
    }
    let jsonData = try! Data(contentsOf: jsonURL)
    
    // Enter SwiftyJSON!
    // moviesData now contains a JSON object representing all the data in the JSON file.
    // This JSON file contains the same data as the tutorial example.
    let moviesData = JSON(data: jsonData)
    
    // We've done you the favor of grabbing an array of JSON objects representing each movie
    let allMoviesData = moviesData["feed"]["entry"].arrayValue
    
    /*
     
     Figure out a way to turn the allMoviesData array into Movie structs!
     
     */
    var allMovies: [Movie] = []
    
    for movie in 0..<allMoviesData.count {
        let newMovie = Movie(json: allMoviesData[movie])
        allMovies.append(newMovie)
    }
    var under15Dollars = [Movie]()
    var disneyMovies = [Movie]()
    var _2016Movies = [Movie]()
    for movie in allMovies {
        if movie.rightsOwner.contains("Disney") {
            disneyMovies.append(movie)
        }
        if movie.price < Double(15) {
            under15Dollars.append(movie)
        }
        if movie.releaseDate .contains("2016") {
            _2016Movies.append(movie)
        }
    }
    
    /*
     
     Uncomment the below print statement and then print out the names of the two Disney
     movies in allMovies. A movie is considered to be a "Disney movie" if `rightsOwner`
     contains the `String` "Disney". Iterate over all the values in `allMovies` to check!
     
     */
    let firstDisneyMovieName: String = disneyMovies[0].name
    let secondDisneyMovieName: String = disneyMovies[1].name
    print("The following movies are Disney movies: \(firstDisneyMovieName) and \(secondDisneyMovieName)")
    print("")
    
    
    
    /*
    
     Uncomment the below print statement and then print out the name and price of each
     movie that costs less than $15. Iterate over all the values in `allMovies` to check!
     
     */
    
    print("The following movies are cost less than $15:")
    for movie in under15Dollars {
        print("\(movie.name) costs $\(movie.price)")
    }
    print("")
    
    
    /*
     
     Uncomment the below print statement and then print out the name and release date of
     each movie released in 2016. Iterate over all the values in `allMovies` to check!
     
     */
//    print("The following movies were released in 2016:")
    for movie in _2016Movies {
        print("\(movie.name) released on \(movie.releaseDate)")
    }
}
