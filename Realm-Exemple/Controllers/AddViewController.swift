//
//  AddViewController.swift
//  Realm-Exemple
//
//  Created by João Luis Santos on 19/01/21.
//  Copyright © 2021 João Luis Santos. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {
    
    let db = RealmStack.shared
    var smartphones: [SmartPhone] = []
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 200))
        datePicker.datePickerMode = .date
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 46))
        let flex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.toolbarDoneButtonPressed))
        toolbar.setItems([cancel, flex, done], animated: true)
        
        birthdayTextField.inputView = datePicker
        birthdayTextField.inputAccessoryView = toolbar
    }
    
    @objc func toolbarDoneButtonPressed() {
        if let datePicker = birthdayTextField.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "dd/MM/yyyy"
            birthdayTextField.text = dateformatter.string(from: datePicker.date)
        }
        self.birthdayTextField.resignFirstResponder()
    }

    @IBAction func addSmartphoneButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "Add new smartphone", preferredStyle: .alert)
        var brandTextField = UITextField()
        var modelTextField = UITextField()
        
        alert.addTextField { textField in
            textField.placeholder = "Brand"
            brandTextField = textField
        }
        alert.addTextField { textField in
            textField.placeholder = "Model"
            modelTextField = textField
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { action in
            guard let brand = brandTextField.text,
                let model = modelTextField.text else { return }
            let smartphone = SmartPhone()
            smartphone.brand = brand
            smartphone.model = model
        
            self.smartphones.append(smartphone)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    @IBAction func addPersonButtonPressed(_ sender: UIButton) {
        guard let name = nameTextField.text,
            let bithdayText = birthdayTextField.text,
            let height = heightTextField.text else { return }
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd/MM/yyyy"
        let birthday = dateformatter.date(from: bithdayText)
        
        let person = Person()
        person.name = name
        person.birthday = birthday
        person.height.value = (height as NSString).floatValue
        
        db.save(person: person, with: self.smartphones)
        
        navigationController?.popViewController(animated: true)
    }
    
}

