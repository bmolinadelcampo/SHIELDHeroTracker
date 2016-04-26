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
