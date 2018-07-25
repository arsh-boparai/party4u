//
//  RestaurantViewController.swift
//  party4upro
//
//  Created by Arshdeep Singh on 2018-07-25.
//  Copyright © 2018 Nancy Sharma. All rights reserved.
//
import MapKit
import UIKit

class RestaurantViewController:  UIViewController,UITableViewDataSource, UITableViewDelegate  {
   
    
     var venues: [String] = []
    @IBOutlet var listTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count;
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate=self
        listTableView.dataSource=self
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "Venues"
       
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response else {
                print("Search error: \(String(describing: error))")
                return
            }
            
            for item in response.mapItems {
                print(item)
                self.venues.append(item.name!)
               self.listTableView.reloadData()
            }
            
         }
 
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "cell2"
        
        let myCell0: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        
        
        myCell0.textLabel!.text = self.venues[indexPath.row]
        
        return myCell0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

  

}
