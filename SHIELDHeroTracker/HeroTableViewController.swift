//
//  HeroTableViewController.swift
//  SHIELDHeroTracker
//
//  Created by Belén Molina del Campo on 25/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

import UIKit

class HeroTableViewController: UITableViewController {
    
    var heroList: [Hero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "S.H.I.E.L.D Hero Tracker"
        loadHeroes()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroList.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("heroCell", forIndexPath: indexPath)

        let currentHero = heroList[indexPath.row]
        cell.textLabel?.text = currentHero.name
        cell.detailTextLabel?.text = currentHero.homeworld
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail"
        {
            if let destinationViewController = segue.destinationViewController as? HeroDetailViewController
            {
                let selectedCell: UITableViewCell = sender as! UITableViewCell
                let selectedHero = heroList[(tableView.indexPathForCell(selectedCell)?.row)!]
                destinationViewController.hero = selectedHero
            }
        }
    }
    
    // MARK: Private Methods
    
    func loadHeroes()
    {
        if let path = NSBundle.mainBundle().pathForResource("heroes", ofType: "json")
        {
            do
            {
                let data =  try! NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                print(data)
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? [[String: AnyObject]]
                {
                    for heroDictionary in jsonResult
                    {
                        let newHero = Hero(dictionary: heroDictionary)
                        heroList.append(newHero)
                    }
                }
            }
            catch
            {
                print("error")
            }
        }
    }
}
