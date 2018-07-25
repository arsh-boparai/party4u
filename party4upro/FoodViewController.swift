//
//  FoodViewController.swift
//  party4upro
//
//  Created by Arshdeep Singh on 2018-07-25.
//  Copyright © 2018 Nancy Sharma. All rights reserved.
//
import MapKit
import UIKit

class FoodViewController: UIViewController,UITableViewDataSource, UITableViewDelegate  {
 var food: [String] = []
    @IBOutlet var listTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate=self
        listTableView.dataSource=self
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "restaurants"
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response else {
                print("Search error: \(String(describing: error))")
                return
            }
            
            for item in response.mapItems {
                print(item)
                self.food.append(item.name!)
                self.listTableView.reloadData()
            }
            
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "cell3"
        
        let myCell0: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        
        
        myCell0.textLabel!.text = self.food[indexPath.row]
        
        return myCell0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
