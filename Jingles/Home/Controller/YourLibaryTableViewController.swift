//
//  YourLibaryTableViewController.swift
//  Jingles
//
//  Created by Mini31 on 27/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit
class YourLibaryTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let array = ["Songs", "Albums", "Artists"]
    var artistSelected = false
    var itemSelected: Int?
    @IBOutlet var libraryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        libraryTableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return array.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YourLibaryTableViewController", for: indexPath)
    
            cell.textLabel?.text = array[indexPath.row]
            cell.textLabel?.textColor = UIColor.white
            cell.textLabel?.highlightedTextColor = UIColor.orange

            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemSelected = indexPath.row
        if itemSelected == 0 {
            self.performSegue(withIdentifier: "allSongsSegue", sender: self)
            
            
        }
        else if itemSelected == 1{
            
            self.performSegue(withIdentifier: "allAlbumsSegue", sender: self)
           
        
        }
        
       else if itemSelected == 2{
            
            self.performSegue(withIdentifier: "allAritstsSegue", sender: self)
            
        }
        
    }
       /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    }
    */
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
   // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
}
