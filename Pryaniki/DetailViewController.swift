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
    @IBOutlet var idLabel: UILabel!
    
    var data: Data!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayer(view: view1)
        setupLayer(view: view2)

        
        backButton.layer.cornerRadius = 20
        backButton.layer.borderColor = UIColor.white.cgColor
        backButton.layer.borderWidth = 5
        
        backButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        backButton.layer.shadowOpacity = 0.3
        backButton.layer.shadowRadius = 5
        
        nameLabel.text = data.name
        idLabel.text = data.data?.text
      

        
    }
    
    func setupLayer(view: UIView) {
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 5
        view.layer.cornerRadius = 15
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
