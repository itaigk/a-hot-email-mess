//
//  RootTVC.swift
//  EmailExample
//
//  Created by Emily Byrne on 9/18/17.
//  Copyright © 2017 Byrne. All rights reserved.
//

import UIKit

protocol CellSelectedDelegate {
    func read(email: Email)
}

class RootTVC: UITableViewController {
    
    var emails = [Email]()
    var delegate: CellSelectedDelegate?
    var trashEmail : Email?
    var folderSelection: String = ""
    let foo = -1

    let spam = Email.init(sender: "totally.not.spam@spam.edu", recipient: "itai.kreisler@asu.edu", subject: "free money and the cure for cancer", contents: "hey whats up i got a lot fo free oney and the cure for canser so just send me your bank info and i can totally get that for you asap this is not a scaam please ignore the typos and poor grammar they dont pay us a lot to write the scam emails")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        if folderSelection == "Inbox" {
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
        if folderSelection == "Sent"{
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(clickedAdd))
            
        }
    }
        
        func clickedAdd(){
            emails.append(spam)
            performSegue(withIdentifier: "backToMenu", sender: self)
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
        return emails.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: react to user selecting row
        //I want the detail view controller to update based on the row that I selected
        
        let selectedEmail = emails[indexPath.row]
        delegate?.read(email: selectedEmail)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let currentEmail = emails[indexPath.row]
        cell.textLabel?.text = currentEmail.subject
        cell.detailTextLabel?.text = currentEmail.sender

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
        if editingStyle == .delete {
            // Delete the row from the data source
            trashEmail = emails.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            performSegue(withIdentifier: "backToMenu", sender: self)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
        let destVC = segue.destination as! MenuTVC
        if folderSelection == "Inbox" {
        destVC.dataDictionary["Inbox"] = emails
        destVC.dataDictionary["Trash"]!.append(trashEmail!)
        }
        
        if folderSelection == "Sent" {
            destVC.dataDictionary["Sent"] = emails
        }
    }


    

}