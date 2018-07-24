//
//  DetailViewController.swift
//  party4upro
//
//  Created by Arshdeep Singh on 2018-07-23.
//  Copyright © 2018 Nancy Sharma. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var theme: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var privateMode: UILabel!
    @IBOutlet weak var listofguests: UILabel!
    var selectedLocation : LocationModel?
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        let name1 = selectedLocation?.name
        let theme1 = selectedLocation?.theme
        let place1 = selectedLocation?.place
        let date1 = selectedLocation?.eventdate
        let private1 = selectedLocation?.priva
        let list1 = selectedLocation?.list
        
        OperationQueue.main.addOperation {
            self.name.text = name1
            self.theme.text = theme1
            self.place.text = place1
            self.date.text = date1
            self.privateMode.text = private1
            self.listofguests.text = list1
            
        }
     
    }
    
  

}
