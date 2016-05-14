//
//  SongTableViewController.swift
//
//  Controller for the table view used to list songs
//
//  Created by C Rus on 10/05/16.
//  Copyright © 2016 crus. All rights reserved.
//

import UIKit

var songList = [Song]()

var activeSong = -1

class SongTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonFileName: String = "songs"
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        
        // Load json db in background thread
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            if let jsonData = self.loadJsonWithSongs(jsonFileName) {
                songList = self.populateSongList(jsonData)!
            }
            dispatch_async(dispatch_get_main_queue()) {
                // Update table view in UI thread
                self.tableView.reloadData()
            }
        }
    }
    
    // load and parse data from json file
    func loadJsonWithSongs(jsonFileName: String) -> [[String: AnyObject]]? {
        
        let jsonObjectName: String = "songs"
        if let url = NSBundle.mainBundle().URLForResource(jsonFileName, withExtension: "json")
        {
            if let urlContent = NSData(contentsOfURL: url) {
                do {
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                    
                    if let songs = jsonResult[jsonObjectName] as? [[String: AnyObject]] {
                        print("Able to parse \(jsonFileName).json")
                        print(songs.count)
                        
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
                    let imgNr = counter % 10
                    let photo = UIImage(named: "img\(imgNr).png")!
                    let description = TextGenerator.getRandomText(200)
                    if let song = Song(title: title, band: band, photo: photo, description: description) {
                        songs += [song]
                    }
                }
            }
            counter += 1
        }
        
        return songs
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return songList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SongTableViewCell", forIndexPath: indexPath) as! SongTableViewCell
        
        // Fetches the appropriate song
        let song = songList[indexPath.row]
        
        cell.titleLabel.text = song.title
        cell.bandLabel.text = song.band
        cell.songImage.image = song.photo

        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        // Set the active song
        activeSong = indexPath.row
        
        return indexPath
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        tableView.reloadData()
        
    }

}
