//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Laila Guzzon Hussein Lailota on 09/04/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit
import SwipeCellKit
import ChameleonFramework

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 80.0
    }

    // TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
                
        cell.delegate = self
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            
            self.updateModel(at: indexPath)
            
        }

        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")

        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        
        return options
    }

    func updateModel(at indexPath: IndexPath) {
        // Update our data model
    }
    
    func updateNavBarColour(_ backgroundColour: UIColor) {
        guard let navBar = navigationController?.navigationBar else {fatalError("Navigation controller does not exist.")}

        let bar = UINavigationBarAppearance()
        //let contrastOfBlackgroundColour = ContrastColorOf(backgroundColour, returnFlat: true)

        bar.backgroundColor = backgroundColour

//        navBar.largeTitleTextAttributes = [.foregroundColor : contrastOfBlackgroundColour]
//        navBar.tintColor = contrastOfBlackgroundColour
//        navBar.barTintColor = backgroundColour
        navBar.standardAppearance = bar
        navBar.compactAppearance = bar
        navBar.scrollEdgeAppearance = bar

    }
}


