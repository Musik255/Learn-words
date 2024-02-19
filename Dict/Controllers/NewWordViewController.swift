//
//  NewWordViewController.swift
//  Dict
//
//  Created by Павел Чвыров on 13.02.2024.
//

import UIKit

class NewWordViewController: UIViewController/*, WordsDelegate*/{

    @IBOutlet weak var englishTextField: UITextField!
    
    @IBOutlet weak var russianTextField: UITextField!
    weak var delegate : MainTableViewController?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func doneTapped(_ sender: Any) {
        guard let englishText = englishTextField.text, englishText != "" else {
            alertEmptyTextField(with: "English word")
            return }
        guard let russianText = russianTextField.text, russianText != "" else {
            alertEmptyTextField(with: "Перевод на русский")
            return }
        let newWord = Word(engWord: englishText, rusWord: russianText)
        addNew(word: newWord)
        navigationController?.popViewController(animated: true)
    }
    
    func addNew(word: Word) {
        delegate?.addNew(word: word)
    }
    
    func alertEmptyTextField(with name : String){
        let alertController = UIAlertController(title: "Поле не заполнено", message: "Заполните поле \(name)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Заполнить", style: .cancel))
        present(alertController, animated: true)
    }

    

}
