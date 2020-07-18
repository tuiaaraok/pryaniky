//
//  DetailViewController.swift
//  Pryaniki
//
//  Created by Айсен Шишигин on 16/07/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var backButton: UIButton!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var idTextLabel: UILabel!
    @IBOutlet var pickerView: UIPickerView!
    
    var selectedRow: Int!
    var data: Data!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        setupLayer(view: view1)
        setupLayer(view: view2)

        
        backButton.layer.cornerRadius = 20
        backButton.layer.borderColor = UIColor.white.cgColor
        backButton.layer.borderWidth = 5
        
        backButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        backButton.layer.shadowOpacity = 0.3
        backButton.layer.shadowRadius = 5
        
        
        
        if data.name == "selector" {
            textLabel.isHidden = true
            idTextLabel.isHidden = true
        } else {
            pickerView.isHidden = true
            selectedRow = nil
        }
        nameLabel.text = data.name
        textLabel.text = data.data?.text
        
        
    }
    
    
    
    override func viewWillLayoutSubviews() {
           super.viewWillLayoutSubviews()
        
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
           
           
           createConstraints()
       }

    

    // метод для установки теней и закругления краев
    
    func setupLayer(view: UIView) {
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 5
        view.layer.cornerRadius = 15
    }
    


}

// MARK: Picker view data sourse

extension DetailViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.data?.variants?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data.data?.variants?[row].text
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
    }
    

}


// MARK: - Create constraints

extension DetailViewController {
    func createConstraints() {
      
    
    view1.widthAnchor.constraint(
        equalTo: view.widthAnchor,
        multiplier: 4/5
        ).isActive = true

    view1.heightAnchor.constraint(
        equalTo: view.heightAnchor,
        multiplier: 1/4
        ).isActive = true

    view1.topAnchor.constraint(
        equalTo: view.safeAreaLayoutGuide.topAnchor,
        constant: 40
        ).isActive = true

    view1.centerXAnchor.constraint(
        equalTo: view.centerXAnchor
        ).isActive = true
        
        
        
        
    view2.widthAnchor.constraint(
        equalTo: view1.widthAnchor
        ).isActive = true

    view2.heightAnchor.constraint(
        equalTo: view1.heightAnchor
        ).isActive = true

    view2.topAnchor.constraint(
        equalTo: view1.bottomAnchor,
        constant: 40
        ).isActive = true

    view2.centerXAnchor.constraint(
        equalTo: view.centerXAnchor
        ).isActive = true
        
        
        
        
        
    backButton.widthAnchor.constraint(
        equalTo: view1.widthAnchor,
        multiplier: 1/4
        ).isActive = true

    backButton.heightAnchor.constraint(
        equalTo: view1.widthAnchor,
        multiplier: 2/11
        ).isActive = true

    backButton.topAnchor.constraint(
        equalTo: view2.bottomAnchor,
        constant: 100
        ).isActive = true

    backButton.centerXAnchor.constraint(
        equalTo: view.centerXAnchor
        ).isActive = true
        
        
        
        
        
    nameLabel.widthAnchor.constraint(
        equalTo: view1.widthAnchor
        ).isActive = true

    nameLabel.heightAnchor.constraint(
        equalTo: view1.heightAnchor,
        multiplier: 1/2
        ).isActive = true

    nameLabel.centerYAnchor.constraint(
        equalTo: view1.centerYAnchor
        ).isActive = true

    nameLabel.centerXAnchor.constraint(
        equalTo: view1.centerXAnchor
        ).isActive = true
        
        
        
        
    textLabel.widthAnchor.constraint(
        equalTo: view2.widthAnchor
        ).isActive = true

    textLabel.heightAnchor.constraint(
        equalTo: view2.heightAnchor,
        multiplier: 1/2
        ).isActive = true

    textLabel.centerYAnchor.constraint(
        equalTo: view2.centerYAnchor
        ).isActive = true

    textLabel.centerXAnchor.constraint(
            equalTo: view2.centerXAnchor
        ).isActive = true




      pickerView.widthAnchor.constraint(
          equalTo: view2.widthAnchor
          ).isActive = true

      pickerView.heightAnchor.constraint(
          equalTo: view1.heightAnchor
          ).isActive = true

      pickerView.topAnchor.constraint(
        equalTo: view2.topAnchor
          ).isActive = true

      pickerView.bottomAnchor.constraint(
          equalTo: view2.bottomAnchor
          ).isActive = true
    
    
    
    }
}
