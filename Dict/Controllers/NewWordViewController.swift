//
//  NewWordViewController.swift
//  Dict
//
//  Created by Павел Чвыров on 13.02.2024.
//

import UIKit

class NewWordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
