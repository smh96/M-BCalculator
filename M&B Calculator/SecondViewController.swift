//
//  SecondViewController.swift
//  M&B Calculator
//
//  Created by Sander Haug on 22/07/2017.
//  Copyright © 2017 Sander Haug. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var acBEM: UILabel!
    @IBOutlet weak var aircraftLabel: UILabel!
    @IBOutlet weak var acMoment: UILabel!
    @IBOutlet weak var acArm: UILabel!
    
    var getReg = String()
    
    var getAcBEM = Double()
    
    var getAcArm = Double()
    
    var getAcMoment = Double()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        aircraftLabel.text = getReg
       
        acBEM.text = String(getAcBEM)
        acArm.text = String(getAcArm)
        acMoment.text = String(getAcMoment)
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
