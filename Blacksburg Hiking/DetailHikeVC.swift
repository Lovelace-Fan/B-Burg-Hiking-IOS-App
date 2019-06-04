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
    
    let hikesText = ["The climb to Angel’s Rest above Pearisburg is notorious among Appalachian Trail hikers for its punishing incline. You must endure a 1.5-mile, 1,650-ft. climb before you can sprawl over a boulder enjoying the view of the New River. The hike is 4.6 miles round trip.","The trail leads to Cascade Falls, one of the most beautiful waterfalls (69 feet) in Virginia and possibly on the entire East Coast. Little Stony Creek cascades over a vertical cliff in several different streams.","Dragon's Tooth Trail is a 4.1 mile moderately trafficked out and back trail located near Catawba, Virginia that offers the chance to see wildlife and is rated as difficult. The trail offers a number of activity options and is best used from March until October. Dogs are also able to use this trail but must be kept on leash.", "Kelly's Knob-Kelly’s Knob is a 6.6-mile, out and back hike on the Appalachian Trail, located on a ridge that bridges the valley between John’s Creek Mountain and Clover Hollow Mountain. While Kelly Knob is not the highest point on the ridgelet — the high point is densely wooded — it still affords a fantastic vista of the New River Valley.", "The Poverty Creek Trail system (also known as Pandapas Pond) is a network of multi-use trails perfect for hiking, running, horseback riding, and mountain biking. There are more than 20 miles of trails of varying degrees of difficulty."]
    
    var images = [UIImage]()
    
    @IBOutlet weak var hikeTextFE: UILabel!
    
    @IBOutlet weak var hikingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0...4 {
            let image = UIImage(named: "hp\(index).png")!;
            images.append(image);
        }

        hikeTextFE?.text = hikesText[hikeIndex];
        hikingImage.image = images[hikeIndex];
    }
    

   

}
