//
//  TableViewCell.swift
//  Pryaniki
//
//  Created by Айсен Шишигин on 16/07/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var mainImage: UIImageView!


   
    
    func configure(with viewItems: [Data], indexPath: IndexPath) {
        
        if viewItems[indexPath.item].name == "picture" {

            guard let url = URL(string: viewItems[indexPath.item].data?.url ?? "") else { return }
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                
                do {
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.mainImage.image = image
                    }
                }
                } catch let error {
                    print(error.localizedDescription)
                }
                
            }.resume()
        } else {
            mainImage.isHidden = true
        }
    }
    
    }
    
   

