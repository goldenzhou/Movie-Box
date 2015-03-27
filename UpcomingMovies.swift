//
//  UpcomingMovies.swift
//  Movie
//
//  Created by Liuyu Zhou on 3/9/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import Foundation

public class UpcomingMovies {
    func getTitle(index: Int) ->String {
        return movieName[index]
    }
    
    func getTime(index: Int) ->String {
        return movieTime[index]
    }
    
    func getDirector(index: Int) ->String {
        return director[index]
    }
    
    func getType(index: Int) ->String {
        return movietype[index]
    }
    
    func getStars(index: Int) ->String {
        return stars[index]
    }
    
    func getScore(index: Int) ->String {
        return ReleaseDate[index]
    }
    
    func getCellTitle(index: Int) ->String {
        return cellTitle[index]
    }
    
    public let movieName: [String] = ["Accidental Love", "The Riot Club", "WARx2", "Tracers", "Can't Stand Losing You: Surviving The Police", "Do You Believe?", "Detective Byomkesh Bakshy", "The Divergent Series: Insurgent", "While We're Young", "White God"]
    
    public let movieTime: [String] = ["1 hr 40 min", "1 hr 57 min", "91 min", "1 hr. 22 min", "1 hr. 55 min", "2 hr. 15 min", "2 hr. 15 min", "1 hr. 58 min", "1 hr. 37 min", "2 hr. 1 min"]
    public let director: [String] = ["David O. Russell", "Lone Scherfig", "Bernie Olaf", "Daniel Benmayor", "Andy Grieve, Lauren Lazin", "Jonathan M. Gunn", "Dibakar Banerjee", "Robert Schwentke", "Noah Baumbach", "Kornel Mundruczo"]
    
    public let movietype: [String] = ["Comedy, Romance", "Drama, Suspense/Thriller", " Documentary", "Action/Adventure, Suspense/Thriller", "Documentary", "Drama", "Suspense/Thriller", "Action/Adventure, Romance, Sci-Fi/Fantasy", "Comedy, Drama", "Drama"]
    
    public let stars: [String] = ["Jessica Biel, Jake Gyllenhaal", "Sam Claflin, Max Irons, Douglas Booth, Jessica Brown Findlay", "None", "Taylor Lautner, Marie Avgeropoulos", "Sting , Stewart Copeland, Andy Summers", "Ted McGinley, Mira Sorvino, Andrea Logan White, Lee Majors", "Sushant Singh Rajput, Anand Tiwari, Swastika Mukherjee", "Shailene Woodley, Theo James, Miles Teller, Jai Courtney, Ansel Elgort", "Ben Stiller, Adam Driver, Naomi Watts, Amanda Seyfried, Charles Grodin", "Zsofia Psotta, Sandor Zsoter, Lili Monori, Szabolcs Thuroczy, Laszlo Galffi"]
    
    public let ReleaseDate: [String] = ["Mar 20, 2015", "Mar 27, 2015", "Mar 20, 2015", "Mar 20, 2015", "Mar 20, 2015", "Mar 20, 2015", "Apr.03, 2015", "Mar 20, 2015", "Mar 27, 2015", "Mar 27, 2015"]
    
    public let cellTitle: [String] = ["poster", "title", "time", "director", "type", "stars", "release date", "theatre"]
    

}
