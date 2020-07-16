//
//  ViewController.swift
//  Pryaniki
//
//  Created by Айсен Шишигин on 16/07/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    
    @IBOutlet var tableView: UITableView!
    
    
    let urlString = "https://pryaniky.com/static/json/sample.json"
    
    var pryanik: Pryanik?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 130
        
       
        fetchData()
    }

    
    
    
    func fetchData() {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                self.pryanik = try JSONDecoder().decode(Pryanik.self, from: data)
                print(self.pryanik?.data?.first?.data?.text ?? "")
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch let error {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return pryanik?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.label.text = pryanik?.data?[indexPath.row].name
        cell.configure(with: pryanik!, indexPath: indexPath)
        
        return cell
    }
    
    
}
