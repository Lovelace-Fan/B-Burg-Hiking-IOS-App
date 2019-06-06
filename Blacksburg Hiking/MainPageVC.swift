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
    var total: Int? = 0;
    
    init(name: String? = nil,
        description: String? = nil,
        hikeIndex: Int? = nil,
        total: Int? = nil
        ) {
        
        self.name = name!;
        self.description = description!;
        self.hikeIndex = hikeIndex!;
        self.total = total!;
        
    }
    
}


class MainPageVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var hIndex = 0;

    var hikeHike = Array<Array<String>>();
    
    @IBOutlet weak var hikePickerButton: UIButton!

    @IBOutlet weak var hikePicker: UIPickerView!
    
   
    
    func readJSONFromFile(fileName: String) -> Any?
    {
        var json: Any?
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                json = try? JSONSerialization.jsonObject(with: data)
            } catch {
                // Handle error here
            }
        }
        return json
    }

    
    override func viewDidLoad() {
        super.viewDidLoad();
        hikePicker.delegate = self;
        hikePicker.dataSource = self;
        

        var jsonData = readJSONFromFile( fileName: "hike_data") as? Array<Any>
        print(type(of: jsonData))
        for index in 0...jsonData!.count - 1 {
            let jsonData2 = jsonData![index] as? Array<String>
            hikeHike.append(jsonData2!);
        }

      
        
       
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
                vc.currentHike.total = detail.total;
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
        return hikeHike.count;
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return hikeHike[row][0].description;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        hikePickerButton.setTitle(hikeHike[row][0].description, for: .normal);
        hikePicker.isHidden = true;
        hIndex = row;
        let hikeOb = HikeOb(name: self.hikeHike[hIndex][0].description, description: self.hikeHike[hIndex][1].description, hikeIndex: hIndex, total: hikeHike.count)
       
       

        performSegue(withIdentifier: "HikeVC", sender: hikeOb)
    }
    
    


}

