//
//  ViewController+UITableView.swift
//  RXSwiftDemo
//
//  Created by Rohit Singh on 2/1/18.
//  Copyright © 2018 Rohit Singh. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.arrOfInputs.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ((self.arrOfInputs[section] )["items"] as! [String]).count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let label = cell.viewWithTag(100) as! UILabel
        let string = ((self.arrOfInputs[indexPath.section] )["items"] as! [String])[indexPath.row]
        label.text = string
        cell.selectionStyle = .none
        return  cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ((self.arrOfInputs[section] )["item"] as! String)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
            case 0:
                switch indexPath.row {
                case 0:
                    self.creatingObservableFromStrings()
                break
                case 1:
                    self.creatingObservableFromArray()
                break
                case 2:
                    creatingObservableFromDictionary()
                break
                default:
                    break
                }
            
            break;
            default:
            break;
        }
    }

}
