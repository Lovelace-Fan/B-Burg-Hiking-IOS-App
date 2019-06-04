//
//  ViewController.swift
//  Blacksburg Hiking
//
//  Created by Artemis Fowl on 6/2/19.
//  Copyright © 2019 Artemis Fowl. All rights reserved.
//

import UIKit

class MainPageVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let hikes = ["Angel's Rest","Cascades","Dragon's Tooth", "Kelly's Knob", "Pandapas Pond"]
    
    
   
    
    var hIndex = 0;
    
//    var csvRows = Array<Array<String>>();
    
    @IBOutlet weak var hikePickerButton: UIButton!

    @IBOutlet weak var hikePicker: UIPickerView!
    
//    func readDataFromCSV(fileName:String, fileType: String)-> String!{
//        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
//            else {
//                return nil
//        }
//        do {
//            var contents = try String(contentsOfFile: filepath, encoding: .utf8)
//            contents = cleanRows(file: contents)
//            return contents
//        } catch {
//            print("File Read Error for file \(filepath)")
//            return nil
//        }
//    }
//
//
//    func cleanRows(file:String)->String{
//        var cleanFile = file
//        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
//        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
//        //        cleanFile = cleanFile.replacingOccurrences(of: ";;", with: "")
//        //        cleanFile = cleanFile.replacingOccurrences(of: ";\n", with: "")
//        return cleanFile
//    }
//
//    func csv(data: String) -> [[String]] {
//        var result: [[String]] = []
//        let rows = data.components(separatedBy: "\n")
//        for row in rows {
//            let columns = row.components(separatedBy: ",")
//            result.append(columns)
//        }
//        return result
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        hikePicker.delegate = self;
        hikePicker.dataSource = self;
        
//        var data = readDataFromCSV(fileName: "test", fileType: "csv")
//        data = cleanRows(file: data!)
//        csvRows = csv(data: data!)
//        print(csvRows[1][1])
        
  
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? DetailHikeVC
        {
            if let detail = sender as? Int
            {
                vc.hikeIndex = detail;
            }
        }
    }
    
    
    @IBAction func hikeButtonPressed(_ sender: Any) {
        hikePicker.isHidden = false;
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hikes.count;
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return hikes[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        hikePickerButton.setTitle(hikes[row], for: .normal);
            hikePicker.isHidden = true;
        hIndex = row;
        performSegue(withIdentifier: "HikeVC", sender: self.hIndex)
    }
    
    


}

