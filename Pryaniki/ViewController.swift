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
    
    
    let urlString = "https://pryaniky.com/static/json/sample.json"
    
    var pryanik: Pryanik?
    var i = 1
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        collectionView.delegate = self
        collectionView.dataSource = self
       
        fetchData()
    }

    @IBAction func unwindSegue (_ sender: UIStoryboardSegue) {}
    
    
    func fetchData() {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                self.pryanik = try JSONDecoder().decode(Pryanik.self, from: data)
                print(self.pryanik?.data?.first?.data?.text ?? "")
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            catch let error {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detail" else { return }
        let detailVC = segue.destination as! DetailViewController
        
       if let indexPaths = self.collectionView.indexPathsForSelectedItems {
           let indexPath = indexPaths.first
        detailVC.data = pryanik?.data![indexPath!.row]
     //   detailVC.idLabel.text = pryanik?.data![indexPath!.row].name
       }

    }
    
    
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return pryanik?.data?.count ?? 0
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cell
        let name = pryanik?.data?[indexPath.item].name
        if name == "hz" {
        cell.label.text = pryanik?.data?[indexPath.item].name
        } else if name == "picture" {
            cell.label.isHidden = true
        }
        
        
        
        cell.configure(with: pryanik!, indexPath: indexPath)
        cell.layer.cornerRadius = 15
        let detailVC = DetailViewController()
        detailVC.setupLayer(view: cell)
        cell.layer.cornerRadius = 20
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 3
     
        
        
        return cell
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           performSegue(withIdentifier: "detail", sender: nil)
       }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let currentHeight = self.view.frame.size.height
           return CGSize(width: UIScreen.main.bounds.width - 48, height: currentHeight * 2 / 9)
       }
    
    
    
}
