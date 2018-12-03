//
//  DetailViewController.swift
//  Crayons
//
//  Created by TingxinLi on 12/3/18.
//  Copyright © 2018 TingxinLi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var crayon: Crayon!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = crayon.color()
    }
    

   
}
