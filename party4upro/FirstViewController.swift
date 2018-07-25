//
//  FirstViewController.swift
//  party4upro
//
//  Created by Nancy Sharma on 2018-07-14.
//  Copyright © 2018 Nancy Sharma. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {



    
    //outlets
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var theme: UITextField!
    @IBOutlet weak var place: UITextField!
   
    @IBOutlet weak var eventDate: UITextField!
 
    @IBOutlet weak var privateMode: UITextField!
    @IBOutlet weak var listOfGuests: UITextView!
    
    
    
    
    //Actions
    
    @IBAction func Saved(_ sender: UIButton) {
        
    }
    
    @IBAction func Save(_ sender: UIButton) {
        let url = NSURL(string: "http://okckabaddiclub.com/recieve.php") // locahost MAMP - change to point to your database server
        
        var request = URLRequest(url: url! as URL)
        request.httpMethod = "POST"
        
        var dataString = "secretWord=44fdcv8jf3" // starting POST string with a secretWord
        dataString = dataString + "&name=\(name.text!)" // add items as name and value
        dataString = dataString + "&theme=\(theme.text!)"
        dataString = dataString + "&place=\(place.text!)"
        dataString = dataString + "&eventDate=\(eventDate.text!)"
        dataString = dataString + "&privateMode=\(privateMode.text!)"
        dataString = dataString + "&listOfGuests=\(listOfGuests.text!)"
    
        let dataD = dataString.data(using: .utf8) // convert to utf8 string
        
        do
        {
            
            // the upload task, uploadJob, is defined here
            
            let uploadJob = URLSession.shared.uploadTask(with: request, from: dataD)
            {
                data, response, error in
                
                if error != nil {
                    
                    // display an alert if there is an error inside the DispatchQueue.main.async
                    
                    DispatchQueue.main.async
                        {
                            let alert = UIAlertController(title: "Upload Didn't Work?", message: "Looks like the connection to the server didn't work.  Do you have Internet access?", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                    }
                }
                else
                {
                    if let unwrappedData = data {
                        
                        let returnedData = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue) // Response from web server hosting the database
                        
                        if returnedData == "1" // insert into database worked
                        {
                            
                            // display an alert if no error and database insert worked (return = 1) inside the DispatchQueue.main.async
                            
                            DispatchQueue.main.async
                                {
                                    let alert = UIAlertController(title: "Done", message: "Party saved.", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                    self.present(alert, animated: true, completion: nil)
                            }
                        }
                        else
                        {
                            // display an alert if an error and database insert didn't worked (return != 1) inside the DispatchQueue.main.async
                            
                            DispatchQueue.main.async
                                {
                                    
                                    let alert = UIAlertController(title: "Upload Didn't Work", message: "Looks like the insert into the database did not worked.", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                    self.present(alert, animated: true, completion: nil)
                            }
                        }
                    }
                }
            }
            uploadJob.resume()
        }
    }
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
         let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


