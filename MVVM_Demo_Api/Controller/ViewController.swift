//
//  ViewController.swift
//  MVVM_Demo_Api
//
//  Created by IPS MAC OS 2 on 23/09/21.
//

import UIKit
import Alamofire



class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureTableView()
    }
 
    func configureTableView(){
        self.tableView.register(UINib(nibName: "UserDataViewCell", bundle: nil), forCellReuseIdentifier: "UserDataViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //fetch user list from server
        self.fetchUserList()
    }
    //fetch User Records
    func fetchUserList(){
        ViewModel.getUserData()
        ViewModel.delegate = self
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ViewModel.arrayUser.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataViewCell", for: indexPath) as! UserDataViewCell
        cell.userModel =  ViewModel.arrayUser[indexPath.row]
        return cell
    }
}
extension ViewController:UserModelDelegate{
    func updateUserInterfaceOnUserList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
