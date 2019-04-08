//
//  SwitchingViewController.swift
//  View Switcher
//
//  Created by Jace Mattson on 2019-02-06.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    
    private var blueViewController: BlueViewController!
    private var yellowViewController: YellowViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue")
            as! BlueViewController
        blueViewController.view.frame = view.frame
        switchViewController(from: nil, to:blueViewController)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchViews(sender: UIBarButtonItem)
    {
        
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
