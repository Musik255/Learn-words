//
//  MainTableViewController.swift
//  Dict
//
//  Created by Павел Чвыров on 12.02.2024.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var words : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        words.append("RIM")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWord))

    }



    
    
    @objc func addWord(){
        performSegue(withIdentifier: "newWordSegue", sender: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return words.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = words[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController,
           segue.identifier == "segueIdent",
           let cell = sender as? UITableViewCell,
           let index = self.tableView.indexPath(for: cell)?.row {
            
            destination.name = words[index]
        }
        if let destination = segue.destination as? NewWordViewController,
           segue.identifier == "newWordSegue"{
//           let cell = sender as? UITableViewCell,
//           let index = self.tableView.indexPath(for: cell)?.row {
//            
//            destination.name = words[index]
        }
        
        

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
//           tableView.deselectRowAtIndexPath(indexPath, animated: true)
//
//           performSegueWithIdentifier("mySegue", sender: cell)
        performSegue(withIdentifier: "detailSegue", sender: cell)
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
