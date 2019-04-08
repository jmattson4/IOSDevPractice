//
//  SecondViewController.swift
//  DemoMultiView
//
//  Created by Jace Mattson on 2019-02-06.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var backgroundColor: UIColor = UIColor.black
    var redColorValue: CGFloat = 0
    var blueColorValue: CGFloat = 0
    var greenColorValue: CGFloat = 0
    
    @IBAction func redSlider(_ sender: UISlider)
    {
        redColorValue = CGFloat(sender.value)
    }
    
    @IBAction func blueSlider(_ sender: UISlider)
    {
        blueColorValue = CGFloat(sender.value)
    }
    @IBAction func greenColorValue(_ sender: UISlider)
    {
        greenColorValue = CGFloat(sender.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
 */
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        // Get the new view controller using segue.destinationViewController.
//        let firstVc = segue.destination as! FirstViewController
//        // Pass the selected object to the new view controller.
//        firstVc.backgroundColor = UIColor(displayP3Red: redColorValue, green: greenColorValue, blue: blueColorValue, alpha: 1)
//    }
 

}
