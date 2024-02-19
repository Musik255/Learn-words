//
//  MainTableViewController.swift
//  Dict
//
//  Created by Павел Чвыров on 12.02.2024.
//

import UIKit

class MainTableViewController: UITableViewController, WordsDelegate {

    var sectionRepository = SectionRepository()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        sectionRepository.getSectsFromUserDefaults()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self, 
                                                            action: #selector(addWord))
        navigationItem.leftBarButtonItem = editButtonItem
    }

}

// MARK: -  Methods TableView for Cells
extension MainTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInstance = sectionRepository.getSectionInstanceByIndex(index: section)
        return sectionInstance.getCountWords()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let sectionInstance = sectionRepository.getSectionInstanceByIndex(index: indexPath.section)
        let words = sectionInstance.getWords()

        content.text = words[indexPath.row].engWord + " - " + words[indexPath.row].rusWord
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: -  Methods TableView for Sections
extension MainTableViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        sectionRepository.getCountSections()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionInstance = sectionRepository.getSectionInstanceByIndex(index: section)
        
        return sectionInstance.getId()
    }
}

// MARK: -  Methods for NewWordViewController
extension MainTableViewController{
    @objc func addWord(){
        performSegue(withIdentifier: "newWordSegue", sender: nil)
    }
    
    func addNew(word: Word) {
        sectionRepository.addNewWord(word: word)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewWordViewController,
               segue.identifier == "newWordSegue"{
            destination.delegate = self
        }
    
        if let destination = segue.destination as? DetailViewController,
           segue.identifier == "detailSegue",
           let cell = sender as? UITableViewCell,
           let index = self.tableView.indexPath(for: cell){
            
            let sectionIndex = sectionRepository.getSectionInstanceByIndex(index: index.section)
            destination.word = sectionIndex.getWordByIndex(index: index.row)
        }
    }
}


// MARK: -  Methods for Editing
extension MainTableViewController{
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
//            tableView.deleteRows(at: [indexPath], with: .fade)
            sectionRepository.removeWord(indexPath: indexPath)
        }
        tableView.reloadData()
    }
}
