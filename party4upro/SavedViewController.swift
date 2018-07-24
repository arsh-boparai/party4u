//
//  SavedViewController.swift
//  party4upro
//
//  Created by Arshdeep Singh on 2018-07-16.
//  Copyright © 2018 Nancy Sharma. All rights reserved.
//

import UIKit

class SavedViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, HomeModelProtocol {
    
    @IBOutlet weak var listTableView: UITableView!
    

    var feedItems: NSArray = NSArray()
    var selectedLocation : LocationModel = LocationModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        // Do any additional setup after loading the view.
    }
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the location to be shown
        let item: LocationModel = feedItems[indexPath.row] as! LocationModel
        // Get references to labels of cell
        myCell.textLabel!.text = item.name
        
        return myCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Set selected location to var
        selectedLocation = feedItems[indexPath.row] as! LocationModel
        // Manually call segue to detail view controller
        self.performSegue(withIdentifier: "detailSegue", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get reference to the destination view controller
        let detailVC  = segue.destination as! DetailViewController
        // Set the property to the selected location so when the view for
        // detail view controller loads, it can access that property to get the feeditem obj
        detailVC.selectedLocation = selectedLocation
    }
    
    
   
    
}
