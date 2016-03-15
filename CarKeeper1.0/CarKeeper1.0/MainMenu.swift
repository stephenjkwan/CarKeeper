//
//  MainMenu.swift
//  CarKeeper1.0
//
//  Created by Stephen Kwan on 2/27/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class MainMenu: UIViewController {
    @IBOutlet weak var MainMenuScrollView: UIScrollView!
    //@IBOutlet weak var MainMenuScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        MainMenuScrollView.contentSize.height = 1000 //random number
        MainMenuScrollView.backgroundColor = UIColor.blueColor()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
