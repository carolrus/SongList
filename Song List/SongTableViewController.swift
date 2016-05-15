//
//  SongTableViewController.swift
//
//  Controller for the table view used to list songs
//
//  Created by C Rus on 10/05/16.
//  Copyright © 2016 crus. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonFileName: String = DataManager.shared.jsonName
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        
        // Load json db in background thread
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            if let jsonData = DataManager.shared.loadJsonWithSongs(jsonFileName) {
                DataManager.shared.songList = DataManager.shared.populateSongList(jsonData)!
            }
            dispatch_async(dispatch_get_main_queue()) {
                // Update table view in UI thread
                self.tableView.reloadData()
            }
        }
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
        return DataManager.shared.songList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SongTableViewCell", forIndexPath: indexPath) as! SongTableViewCell
        
        // Fetches the appropriate song
        let song = DataManager.shared.songList[indexPath.row]
        
        cell.titleLabel.text = song.title
        cell.bandLabel.text = song.band
        cell.songImage.image = UIImage(named: song.photoPath)

        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        // Set the active song
        DataManager.shared.activeSong = indexPath.row
        
        return indexPath
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        // This makes sure the table view is up-to-date when returning
        // from another view that modified the data
        tableView.reloadData()
        
    }

}
