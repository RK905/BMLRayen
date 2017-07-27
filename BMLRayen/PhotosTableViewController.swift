//
//  PhotosTableViewController.swift
//  BMLRayen
//
//  Created by Rayen Kamta on 7/27/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class PhotosTableViewController: UITableViewController {
var ptVM: PhotoTableVM = PhotoTableVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reactive.reloadData <~ ptVM.signalReload

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

    override func viewWillAppear(_ animated: Bool) {
        ptVM.request()
    }
    
   
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ptVM.receivedData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        cell.viewModel = ptVM.getPostCellViewModel(atIndex: indexPath.row)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let destination = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
            
            if let photoVM:PhotoCellVM = ptVM.getPostCellViewModel(atIndex: indexPath.row) {
                destination.viewModel = DetailVM(withPhoto: photoVM)
                navigationController?.pushViewController(destination, animated: true)
            }
        }
    }



}
