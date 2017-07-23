//
//  ViewController.swift
//  M&B Calculator
//
//  Created by Sander Haug on 20/07/2017.
//  Copyright © 2017 Sander Haug. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
   

    //UI OBJ
    @IBOutlet weak var tableView: UITableView!
    
    //Code OBJ
   var acArray = [AnyObject]()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Declaring URL
        let url = NSURL(string: "http://sanderhaug.com/api.php")!
        
        //Declaring request of URL
        let request = NSMutableURLRequest(url: url as URL)
        
        //Executing Request
        URLSession.shared.dataTask(with: request as URLRequest) { (data:Data?, response:URLResponse?, error:Error?) in
            
            //Error
            if error != nil {
                print("Error: \(String(describing: error))")
            }
            
            //Get back JSON data
            do {
                //Declaring variable to store JSON data
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                
                //secured way to declare new var
                guard let parsedJSON = json else {
                    print("Error while parsing")
                    return
                }
                
                guard let aircraftJSON = parsedJSON["Aircraft"] else {
                    print("Error while parsing")
                    return
                    
                }
                
                print(parsedJSON)
                
                self.acArray = aircraftJSON as! [AnyObject]
                self.tableView.reloadData()
            }
            catch {
                print("Error \(error)")
            }
            
        }.resume()
        
        
    }
    
    //Cell numbers
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return acArray.count
    }
    
    //Cell Config
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Declare cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        let acName = acArray[indexPath.row]["AC_Reg"]
        let type = acArray[indexPath.row]["AC_Type"]
        
        cell.acReg.text = acName as? String
        cell.acType.text = type as? String
        
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let SvC = Storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        SvC.getReg = acArray[indexPath.row]["AC_Reg"] as! String
        SvC.getAcBEM = (acArray[indexPath.row]["BEM"] as! NSString).doubleValue
        SvC.getAcArm = (acArray[indexPath.row]["Arm"] as! NSString).doubleValue
        SvC.getAcMoment = (acArray[indexPath.row]["Moment"] as! NSString).doubleValue

        
        self.navigationController?.pushViewController(SvC, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

