//
//  GamblingSpinnerViewController.swift
//  Assignment3jacemattson
//
//  Created by Jace Mattson on 2019-03-15.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import UIKit

class GamblingSpinnerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = images[row]
        let imageView = UIImageView(image: image)
        return imageView
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 120
    }
    private var images:[UIImage]!

    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var winLabel: UILabel!
    
    @IBAction func spin(_ sender: UIButton) {
        var win = false
        var numInRow = -1
        var lastVal = -1
        
        let controller = UIAlertController(title: "Gamble?", message: "Would you like to Gamble?", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes I do", style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
        for i in 0..<4{
            let newValue = Int(arc4random_uniform(UInt32(images.count)))
            if newValue == lastVal{
                numInRow += 1
            }
            else{
                numInRow = 1
            }
            lastVal = newValue
            
            picker.selectRow(newValue, inComponent: i, animated: true)
            picker.reloadComponent(i)
            if numInRow >= 4{
                win = true
            }
        }
        // could not figure out how to write to a plist the textbook code is out of date and anywhere i look online is just super confusing 
        if win == true{
            let array: NSArray = ["Win"]
            let tempDirPath = NSTemporaryDirectory()
            let tempDirUrl = NSURL(fileURLWithPath: tempDirPath)
            let tempFileUrl = tempDirUrl.appendingPathComponent("WinsLosses.Plist")
            array.write(to: tempFileUrl!, atomically: true)
        }
        if win == false {
            let array: NSArray = ["Loss"]
            let tempDirPath = NSTemporaryDirectory()
            let tempDirUrl = NSURL(fileURLWithPath: tempDirPath)
            let tempFileUrl = tempDirUrl.appendingPathComponent("WinsLosses.Plist")
            array.write(to: tempFileUrl!, atomically: true)
        }
        winLabel.text = win ? "WINNER" : " "

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        images = [
            UIImage(named: "Apple")!,
            UIImage(named: "Banana")!,
            UIImage(named: "Orange")!,
            UIImage(named: "Grape")!
            ]
        winLabel.text = " "
        arc4random_stir()
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
