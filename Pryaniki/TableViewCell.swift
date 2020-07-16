//
//  TableViewCell.swift
//  Pryaniki
//
//  Created by Айсен Шишигин on 16/07/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var label: UILabel!
    @IBOutlet var mainImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with pryanik: Pryanik, indexPath: IndexPath) {
        
        if pryanik.data?[indexPath.row].name == "picture" {

            guard let url = URL(string: pryanik.data?[indexPath.row].data?.url ?? "") else { return }
            
            let session = URLSession.shared
            
            session.dataTask(with: url) { (data, _, _) in
                
                
                do {
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.mainImage.image = image
                        print("fvf")
                    }
                }
                } catch let error {
                    print(error.localizedDescription)
                }
                
            }.resume()
        }
    }
        
    }
    
   

