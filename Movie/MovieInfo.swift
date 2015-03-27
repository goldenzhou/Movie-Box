//
//  MovieInfo.swift
//  Movie
//
//  Created by Liuyu Zhou on 3/5/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import Foundation

public class MovieInfo {
    
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
        return score[index]
    }
    
    func getCellTitle(index: Int) ->String {
        return cellTitle[index]
    }
    
    public let movieName: [String] = ["Chappie", "The Second Best Exotic Marigold Hotel", "Unfinished Business", "Merchants of Doubt", "Compared to What: The Improbable Journey of Barney Frank", "Fifty Shades of Grey", "Kingsman: The Secret Service", "The SpongeBob Movie: Sponge Out of Water", "McFarland, USA", "The DUFF", "American Sniper", "Hot Tub Time Machine 2", "Jupiter Ascending", "The Imitation Game", "Paddington"]
    
    public let movieTime: [String] = ["120min", "122min", "91min", "96min", "87min", "125min", "129min", "92min", "129min", "101min", "132min", "93min", "127min", "114min", "95min"]
    public let director: [String] = ["Neill Blomkamp", " John Madden", " Ken Scott", "Robert Kenner", " Sheila Canavan Michael Chandler", " Sam Taylor-Johnson", " Matthew Vaughn", " Paul Tibbitt", " Niki Caro", " Ari Sandel", " Clint Eastwood", " Steve Pink", " Andy Wachowski | Lana Wachowski", "Morten Tyldum", "Paul King"]
    public let movietype: [String] = ["Action | Sci-Fi | Thriller", "Comedy | Drama", "Comedy", "Documentary", "Documentary | Biography | Drama", "Drama | Romance", "Action | Adventure | Comedy | Crime", "Animation | Adventure | Comedy | Family", "Drama | Sport", "Comedy", "Action | Biography | Drama | War", "Comedy | Sci-Fi", "Action | Adventure | Sci-Fi", "Biography | Drama | Thriller | War", "Comedy | Family"]
    
    public let stars: [String] = ["Sharlto Copley, Dev Patel, Hugh Jackman, Sigourney Weaver", "Judi Dench, Maggie Smith, Bill Nighy, Dev Patel", "Vince Vaughn, Dave Franco, Tom Wilkinson, James Marsden", "Frederick Singer, Naomi Oreskes, Jamy Ian Swiss, Sam Roe", "Barney Frank, Spencer Bachus, Mike Barnicle, Neil Barofsky", "Dakota Johnson, Jamie Dornan, Jennifer Ehle, Eloise Mumford", "Colin Firth, Taron Egerton, Samuel L. Jackson, Michael Caine", "Tom Kenny, Antonio Banderas, Bill Fagerbakke, Clancy Brown", "Kevin Costner, Maria Bello, Ramiro Rodriguez, Carlos Pratts", "Mae Whitman, Bella Thorne, Robbie Amell, Allison Janney", "Bradley Cooper, Sienna Miller, Kyle Gallner, Cole Konis", "Rob Corddry, Craig Robinson, Clark Duke, Adam Scott", "Channing Tatum, Mila Kunis, Eddie Redmayne, Sean Bean", "Benedict Cumberbatch, Keira Knightley, Matthew Goode, Allen Leech", "Hugh Bonneville, Sally Hawkins, Julie Walters, Jim Broadbent"]
    
    public let score: [String] = ["3.8", "5.3", "3.2", "7.1", "0", "4.2", "8.2", "6.6", "7.7", "7.2", "7.4", "5.2", "5.9", "8.2", "7.5"]
    
    public let cellTitle: [String] = ["poster", "title", "time", "director", "type", "stars", "score", "theatre"]
    
    
}
