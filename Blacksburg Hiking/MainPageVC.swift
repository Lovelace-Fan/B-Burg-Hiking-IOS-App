//
//  ViewController.swift
//  Blacksburg Hiking
//
//  Created by Artemis Fowl on 6/2/19.
//  Copyright © 2019 Artemis Fowl. All rights reserved.
//

import UIKit


struct HikeOb {
    var name = "";
    var description = "";
    var hikeIndex: Int? = 0;
    
    init(name: String? = nil,
        description: String? = nil,
        hikeIndex: Int? = nil
        ) {
        
        self.name = name!;
        self.description = description!;
        self.hikeIndex = hikeIndex!;
        
    }
    
}


class MainPageVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var hIndex = 0;
    
    var csvRows = Array<Array<String>>();
    
    @IBOutlet weak var hikePickerButton: UIButton!

    @IBOutlet weak var hikePicker: UIPickerView!
    
    func readDataFromCSV(fileName:String, fileType: String)-> String!{
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
            else {
                return nil
        }
        do {
            var contents = try String(contentsOfFile: filepath, encoding: .utf8)
            contents = cleanRows(file: contents)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }


    func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        return cleanFile
    }

    func csv(data: String) -> [[String]] {
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        for row in rows {
            let columns = row.components(separatedBy: ",")
            result.append(columns)
        }
        return result
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        hikePicker.delegate = self;
        hikePicker.dataSource = self;
        
        var data = readDataFromCSV(fileName: "hike_data", fileType: "csv")
        data = cleanRows(file: data!)
        csvRows = csv(data: data!)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? DetailHikeVC
        {
            if let detail = sender as? HikeOb
            {
                vc.currentHike.description = detail.description;
                vc.currentHike.name = detail.name;
                vc.currentHike.hikeIndex = detail.hikeIndex;
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
        return csvRows.count;
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return csvRows[row][0].description;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        hikePickerButton.setTitle(csvRows[row][0].description, for: .normal);
        hikePicker.isHidden = true;
        hIndex = row;
        let hikeOb = HikeOb(name: self.csvRows[hIndex][0].description, description: self.csvRows[hIndex][1].description, hikeIndex: hIndex)
       
       

        performSegue(withIdentifier: "HikeVC", sender: hikeOb)
    }
    
    


}

