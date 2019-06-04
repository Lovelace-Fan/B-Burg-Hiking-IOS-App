//
//  DetailHikeVC.swift
//  Blacksburg Hiking
//
//  Created by Artemis Fowl on 6/3/19.
//  Copyright © 2019 Artemis Fowl. All rights reserved.
//

import UIKit

class DetailHikeVC: UIViewController {

    var hikeIndex: Int = 0;
    var currentHike: HikeOb = HikeOb(name: "", description: "", hikeIndex: 0)
    
    
    
    var images = [UIImage]()
    
    @IBOutlet weak var hikeTextFE: UILabel!
    
    @IBOutlet weak var hikingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0...4 {
            let image = UIImage(named: "hp\(index).png")!;
            images.append(image);
        }

       
        hikeTextFE?.text = currentHike.description;
        hikingImage.image = images[currentHike.hikeIndex!];
    }
    

   

}
