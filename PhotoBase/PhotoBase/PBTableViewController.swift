//
//  PBTableViewController.swift
//  PhotoBase
//
//  Created by Mike Laursen on 8/22/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import CoreData
import UIKit

class PBTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    let pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var frc = NSFetchedResultsController<NSFetchRequestResult>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = max(120.0, UIScreen.main.bounds.size.width / 3.0)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        fetchTableData()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchTableData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return frc.sections != nil ? frc.sections!.count : 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (frc.sections?[section].numberOfObjects)!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PBTableViewCell
        let item = frc.object(at: indexPath) as! Entity
        cell.descriptionLabel.text = item.descr
        cell.photoView.image = UIImage(data: (item.image)! as Data)
        cell.titleLabel.text = item.title
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let managedObject = frc.object(at: indexPath) as! NSManagedObject
        pc.delete(managedObject)
        
        do {
            try pc.save()
        } catch {
            print(error)
            return
        }
    }
    
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
        
        if segue.identifier == "Edit" {
            let cell = sender as! PBTableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let itemController = segue.destination as! AddViewController
            let item = frc.object(at: indexPath!) as! Entity
            itemController.item = item
        }
    }
    
    // MARK: - NSFetchedResultsControllerDelegate Methods

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
    
    // MARK: - Utility Methods
    
    func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        let sorter = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sorter]
        return fetchRequest
    }
    
    private func fetchTableData() {
        frc = getFRC()
        frc.delegate = self
        
        do {
            try frc.performFetch()
        }
        catch {
            print(error)
            return
        }
        
        tableView.reloadData()
    }
    
    func getFRC() -> NSFetchedResultsController<NSFetchRequestResult> {
        frc = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: pc, sectionNameKeyPath: nil, cacheName: nil)
        return frc
    }
}
