//
//  ViewController.swift
//  Pryaniki
//
//  Created by Айсен Шишигин on 16/07/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pryanikyLabel: UIImageView!
    
    let urlString = "https://pryaniky.com/static/json/sample.json"
    var pryanik: Pryanik?
    var selectedRow: Int!
    var viewItems: [Data]!
   
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        fetchData()
    }
    
    
    

    @IBAction func unwindSegue (_ sender: UIStoryboardSegue) {
    
        if let source = sender.source as? DetailViewController {
            selectedRow = source.selectedRow
            if selectedRow != nil {
                if let indexPaths = self.collectionView.indexPathsForSelectedItems {
                    collectionView.reloadItems(at: indexPaths)
                }
            }
        }
    }
    
    
    
    
    func fetchData() {
        
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                self.pryanik = try JSONDecoder().decode(Pryanik.self, from: data)
                
                DispatchQueue.main.async {
                    self.viewItems = self.pryanik?.data
                    guard let element = self.pryanik?.data?.first else {return}
                    self.viewItems.append(element)
                    
                 //    меняем местами элементы массива
                    let i = self.viewItems[1]
                    self.viewItems[1] = self.viewItems[2]
                    self.viewItems[2] = i
                    
                    self.collectionView.reloadData()
                }
            }
            catch let error {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPaths = self.collectionView.indexPathsForSelectedItems {
            let detailVC = segue.destination as! DetailViewController
            let indexPath = indexPaths.first
            detailVC.data = viewItems[indexPath!.row]
            detailVC.selectedRow = selectedRow
    
        }
    }
}



// MARK: - Collection view extentions

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return viewItems?.count ?? 0
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cell
        

        let name = viewItems[indexPath.item].name
        
        if name == "hz" {
            cell.label.text = name
            cell.mainImage.isHidden = true
        } else if name == "picture" {
            cell.label.isHidden = true
        } else if  name == "selector" {
            cell.mainImage.isHidden = true
            cell.label.text = viewItems[1].data?.variants?[selectedRow ?? 0].text
        }
        
        
        
        cell.configure(with: viewItems!, indexPath: indexPath)
        cell.layer.cornerRadius = 15
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 2
        
        
        return cell
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           performSegue(withIdentifier: "detail", sender: nil)
       }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let currentHeight = self.view.frame.size.height
        return CGSize(width: collectionView.frame.width - 20, height: (currentHeight * 2) / 11)

       }
    
    
}
