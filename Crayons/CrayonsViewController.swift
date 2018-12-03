//
//  ViewController.swift
//  Crayons
//
//  Created by TingxinLi on 12/3/18.
//  Copyright © 2018 TingxinLi. All rights reserved.
//

import UIKit

class CrayonsViewController: UIViewController {

    
    @IBOutlet weak var CrayonTabelView: UITableView!
    
    var crayon = Crayon.allTheCrayons
        
    override func viewDidLoad() {
        super.viewDidLoad()
        CrayonTabelView.dataSource = self
        title = "Crayons"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = CrayonTabelView.indexPathForSelectedRow,
            let DetailViewController = segue.destination as? DetailViewController else { fatalError("missing indexPath, crayonDetailController") }
        let crayons = crayon[indexPath.row]
        DetailViewController.crayon = crayons
    }

}

extension CrayonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CrayonTabelView.dequeueReusableCell(withIdentifier: "CrayonCell", for: indexPath)
        let crayons = crayon[indexPath.row]
        if crayons.name == "Black" {
            cell.textLabel?.textColor = .white
            cell.detailTextLabel?.textColor = .white
        }
        cell.textLabel?.text = crayons.name
        cell.detailTextLabel?.text = crayons.hex
        //cell.backgroundColor = UIColor(displayP3Red: CGFloat(crayons.red / 255), green: CGFloat(crayons.green / 255), blue: CGFloat(crayons.blue / 255), alpha: 1.0)

        cell.backgroundColor = crayons.color()
        return cell
    }
    
    
}
