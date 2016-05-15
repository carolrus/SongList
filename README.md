# SongList

## Description
This repository contains an iOS app that shows a list of songs, currently with 100 items. If a song is pressed it displays details about it.

* Currently, app comes with a preloaded JSON database. The database's content is taken from http://www.billboard.com/charts/hot-100. JSON includes title and band for each song, and it has, currently, 100 items.
* For each song, a 200 characters description is generated with a simple random text generator based on a word database taken from https://github.com/lukaskubanek/LoremSwiftum
* Each song has an image associated. App comes with 10 images that are reused sequentially. The images are free cliparts (png format) from http://www.webweaver.nu/clipart/music/

## Architecture
The application has currently 2 views, one that contains a table view with song list, and one that display details about a song. A Navigation Controller is used to move between views.

Each cell in table view is designed to show song's photo, title, and band. The song's details view shows also the song's description.

Shared data between views is stored via a singleton class.

The data from JSON db is loaded into an array when app starts.

Auto layout constraints have been used to make the valid for different screen sizes, including portrait/landscape.

## TODO
* Move from JSON to Core Data
* Implement possibility to add and delete items

## Compatibility
The code from this repository was developed in XCode 7 with Swift 2 and tested with iOS 9.
