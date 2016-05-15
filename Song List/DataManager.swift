//
//  DataManager.swift
//
// Signelton class to store global data
//
//  Created by C Rus on 15/05/16.
//  Copyright © 2016 crus. All rights reserved.
//

import Foundation

public class DataManager
{
    static let shared = DataManager()
    
    // CONSTANTS
    // Const showing the number of images avaiable to be used
    let imgCount: Int = 10
    
    // Const string showing the image name
    let imgPrefix: String = "img"
    
    // Const string showing the json name
    let jsonName: String = "songs"
    
    // Const int showing the length of generated text for song description
    let textLength: Int = 200
    
    // VARIABLES
    // An Int to store selected song
    var activeSong: Int = -1
    
    // An array to store the list of songs
    var songList = [Song]()
    
    // load and parse data from json file
    func loadJsonWithSongs(jsonFileName: String) -> [[String: AnyObject]]? {
        
        let jsonObjectName: String = jsonFileName // same name as file name in this case
        if let url = NSBundle.mainBundle().URLForResource(jsonFileName, withExtension: "json")
        {
            if let urlContent = NSData(contentsOfURL: url) {
                do {
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                    
                    if let songs = jsonResult[jsonObjectName] as? [[String: AnyObject]] {
                        
                        return songs
                    }
                } catch {
                    print("Unable to parse \(jsonFileName).json")
                }
            } else {
                print("Not able to load \(jsonFileName).json.")
            }
        } else {
            
            print("\(jsonFileName).json NOT found")
            
        }
        
        return nil
    }
    
    // populate the songs array with data from json db
    func populateSongList(jsonData: [[String: AnyObject]]) -> [Song]? {
        
        var songs = [Song]()
        var counter = 0
        
        for item in jsonData {
            if let title = item["title"] as? String {
                if let band = item["band"] as? String {
                    let imgNr = counter % imgCount
                    let photoPath = imgPrefix + "\(imgNr).png"
                    let description = TextGenerator.getRandomText(textLength)
                    if let song = Song(title: title, band: band, photoPath: photoPath, description: description) {
                        songs += [song]
                    }
                }
            }
            counter += 1
        }
        
        return songs
        
    }
    
}
