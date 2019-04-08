//
//  ViewController.swift
//  Orientations
//
//  Created by Jace Mattson on 2019-01-28.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask(rawValue: UIInterfaceOrientationMask.portrait.rawValue
        | UIInterfaceOrientationMask.landscapeLeft.rawValue)
    }
}

