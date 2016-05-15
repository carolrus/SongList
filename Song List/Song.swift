//
//  Song.swift
//
//  Class to hold data and methods related to a single song
//
//  Created by C Rus on 11/05/16.
//  Copyright © 2016 crus. All rights reserved.
//

import UIKit

class Song {
    
    var title: String
    var band: String
    var photoPath: String
    var description: String
    
    init?(title: String, band: String, photoPath: String, description: String) {
        // Initialize stored properties.
        self.title = title
        self.band = band
        self.photoPath = photoPath
        self.description = description
        
        // Initialization should fail if there is no title or no band.
        if title.isEmpty || band.isEmpty {
            return nil
        }
    }


}
