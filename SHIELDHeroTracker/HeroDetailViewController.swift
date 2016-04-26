//
//  HeroDetailViewController.swift
//  SHIELDHeroTracker
//
//  Created by Belén Molina del Campo on 25/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController {
    var hero: Hero!
    
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroHomeworldLabel: UILabel!
    @IBOutlet weak var heroSuperpowersLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(hero.name)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
