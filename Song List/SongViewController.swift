//
//  SongViewController.swift
//
//  Controller for the view used to show details about one song
//
//  Created by C Rus on 09/05/16.
//  Copyright © 2016 crus. All rights reserved.
//

import UIKit

class SongViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bandLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if DataManager.shared.activeSong != -1 {
            
            // Set data for UI elements accordingly for the active song
            let song = DataManager.shared.songList[DataManager.shared.activeSong]
            imageView.image = UIImage(named: song.photoPath)
            titleLabel.text = song.title
            bandLabel.text = song.band
            descriptionLabel.text = song.description
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

