//
//  ListTownTableViewController.swift
//  [JD]My_Weather_Station
//
//  Created by Developer on 13/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA And ArchLoy. All rights reserved.//

import UIKit

class ListTownTableViewController: UITableViewController {

    @IBOutlet weak var ListTown: UITableViewCell!
    
    @IBOutlet weak var buttonAddTown: UIBarButtonItem!
    
    @IBOutlet weak var buttonReturn: UIBarButtonItem!
    
    @IBOutlet var m_tableview: UITableView!
    
    var villeParis:Ville = Ville(m_nom: "Paris", m_longitude:"2.3488000", m_latitude:"48.8534100")
    var villeLondre:Ville = Ville(m_nom:"Londre", m_longitude:"-0.1257400",m_latitude:"51.5085300")
    
    var items: [String] = ["We", "Hate", "Swift"]
    
    var listeVille:VillesAjoutees = VillesAjoutees()
    
    @IBAction func AddTown(sender: AnyObject) {
        
    }
    
    func ShowTown (){
        

    } 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        m_tableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseId1")
        
        listeVille.add(villeParis)
        listeVille.add(villeLondre)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }*/

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return listeVille.count()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseId1", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the cell...
        cell.textLabel.text = listeVille.getAt(indexPath.row).nom
        //cell.detailTextLabel.text = "Latitude : " + villeParis.latitude + ", Longitude : " + villeParis.longitude
        
        return UITableViewCell()
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    }*/

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
