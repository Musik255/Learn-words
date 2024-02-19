//
//  DetailViewController.swift
//  Dict
//
//  Created by Павел Чвыров on 12.02.2024.
//

import UIKit

class DetailViewController: UIViewController{
    
    

    
//    weak var delegate : MainTableViewController?
    
    @IBOutlet weak var engWord: UILabel!
    @IBOutlet weak var rusWord: UILabel!
    var word : Word?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        engWord.text = word?.engWord
        rusWord.text = word?.rusWord
    }
    
}
