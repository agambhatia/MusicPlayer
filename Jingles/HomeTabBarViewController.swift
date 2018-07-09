//
//  HomeTabBarViewController.swift
//  Jingles
//
//  Created by Mini31 on 12/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit

class HomeTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       LibraryManager.shared.initialise()
        
        

        // Do any additional setup after loading the view.
        
        let originX: CGFloat = 0.0
        let controller:MiniPlayerViewController = self.storyboard!.instantiateViewController(withIdentifier: "MiniPlayerViewController") as! MiniPlayerViewController
        let height: CGFloat = 67.0  //controller.view.bounds.height
        let width = controller.view.bounds.width
        let originY = view.bounds.height - tabBar.bounds.height - height
        
       controller.view.frame = CGRect(x: originX, y: originY, width: width, height: height)
    
        self.view.addSubview(controller.view)
        
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
