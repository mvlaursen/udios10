//
//  SocialViewController.swift
//  LondonLandscaping
//
//  Created by Mike Laursen on 8/7/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class SocialViewController: UITableViewController {
    // TODO: This should be in a data structure.
    let imageList = ["SocialIcon1", "SocialIcon2", "SocialIcon3", "SocialIcon4", "SocialIcon5", "SocialIcon6", ]
    let titleList = ["Like us on Facebook", "Follow us on Twitter", "Add us on Google Plus", "Connect to us on LinkedIn", "Subscribe to us on YouTube", "Check out our website"]
    let urlList = ["http://facebook.com", "http://twitter.com", "http://google.com", "http://linkedin.com", "http://youtube.com", "http://londonlandscaping.co.uk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imageList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Social Cell", for: indexPath) as! SocialCell
        cell.cellImageView.image = UIImage(named: imageList[indexPath.row])
        cell.cellLabel.text = titleList[indexPath.row]
        return cell
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let detailVC = segue.destination as! SocialDetailViewController
        let indexPath = tableView.indexPathForSelectedRow
        detailVC.socialMediaTitle = titleList[indexPath!.row]
        detailVC.socialMediaUrl = URL(string: urlList[indexPath!.row])
    }
}
