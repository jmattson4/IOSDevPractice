//
//  GamblingSpinnerViewController.swift
//  Assignment3jacemattson
//
//  Created by Jace Mattson on 2019-03-15.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import UIKit

class GamblingSpinnerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var winsLosses = WinLossAverage()
    var dataManager = WinsLossesDataManager()
    var userName: String? = " "
    var slotLevel = 3.00
    var intSlotLevel = 0
    var darkTheme = false
    func takeUserSettings(){
        let defaults = UserDefaults.standard
        userName = defaults.string(forKey: "gamblersName")
        slotLevel = defaults.object(forKey: "slotLevel") as! Double
        intSlotLevel =  Int(slotLevel)
        darkTheme = defaults.bool(forKey: "darkTheme")
        if darkTheme == true {
            view.backgroundColor = UIColor.black
        }
        else if darkTheme == false{
            view.backgroundColor = UIColor.white
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return intSlotLevel
    }
    @objc func applicationWillEnterForeground(notifaction:NSNotification){
        let defaults = UserDefaults.standard
        defaults.synchronize()
        takeUserSettings()
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
        let action = UIAlertAction(title: "Yes I do", style: .default, handler: { action in
            for i in 0..<self.intSlotLevel{
                let newValue = Int(arc4random_uniform(UInt32(self.images.count)))
                if newValue == lastVal{
                    numInRow += 1
                }
                else{
                    numInRow = 1
                }
                lastVal = newValue
                
                self.picker.selectRow(newValue, inComponent: i, animated: true)
                self.picker.reloadComponent(i)
                if numInRow >= self.intSlotLevel{
                    win = true
                }
            }
            if win == true {
                self.self.winLabel.text = " You WIN \(self.self.userName!)"
                self.winsLosses.win = self.winsLosses.win + 1
                
            }
            else {
                self.winLabel.text = " "
                self.winsLosses.loss = self.winsLosses.loss + 1
            }
        })    
        let closeAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        controller.addAction(action)
        controller.addAction(closeAction)
        present(controller, animated: true, completion: nil)
        //takes the win loss average then adds that to the plist file
        winsLosses.average = Double(winsLosses.win) / Double(winsLosses.loss)
        dataManager.winsLossesAverages.append(winsLosses)
        self.dataManager.writeToFile()
    }
    func loadImagesArray(){
        if intSlotLevel == 2{
            images = [
                UIImage(named: "Apple")!,
                UIImage(named: "Banana")!
            ]
        }
        else if intSlotLevel == 3{
            images = [
                UIImage(named: "Apple")!,
                UIImage(named: "Banana")!,
                UIImage(named: "Orange")!
            ]
        }
        else if intSlotLevel == 4{
            images = [
                UIImage(named: "Apple")!,
                UIImage(named: "Banana")!,
                UIImage(named: "Orange")!,
                UIImage(named: "Grape")!
            ]
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        takeUserSettings()
        loadImagesArray()
        winLabel.text = " "
        arc4random_stir()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        takeUserSettings()
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillEnterForeground(notifaction:)), name: Notification.Name.UIApplicationWillEnterForeground, object: app)
        loadImagesArray()
        picker.delegate = self
        picker.dataSource = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
        
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
