//
//  ViewControllerSplash.swift
//  IronWaterTest
//
//  Created by админ on 18.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import UIKit

class ViewControllerSplash: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        perform(#selector(ViewControllerSplash.showNavigationContrioller), with: self, afterDelay: 4)

     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func showNavigationContrioller() {
        
        performSegue(withIdentifier: "showNextController", sender: self)
    }
    



}
