//
//  ViewController.swift
//  SearchDemo
//
//  Created by MacMini on 06/02/18.
//  Copyright © 2018 MacMini. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet var tbl_List: UITableView!
    var arr_Table: NSMutableArray = get_data_list()
    
    @IBOutlet var segment_search: UISegmentedControl!
    @IBOutlet var txt_Search: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbl_List.estimatedRowHeight = 80.0
        tbl_List.rowHeight = UITableViewAutomaticDimension
        
        txt_Search.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- TEXT FIELD RETURN DELEGATE
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
    //MARK:- SEARCH CLICKED
    @IBAction func search_Clicked(_ sender: Any) {
        if (txt_Search.text?.count)! > 0 {
            let arr_List: NSArray = get_data_list()
            var predicate = NSPredicate(format: "Name BEGINSWITH[c] %@", txt_Search.text!.uppercased())
            if segment_search.selectedSegmentIndex == 1 {
                predicate = NSPredicate(format: "Rank CONTAINS %@", txt_Search.text!)
            }
            else if segment_search.selectedSegmentIndex == 2 {
                predicate = NSPredicate(format: "Year BEGINSWITH[c] %@", txt_Search.text!.capitalized)
            }
            
            arr_Table = NSMutableArray()
            let arr_val = arr_List.filtered(using: predicate) as NSArray
            print(arr_val)
            arr_Table = arr_val.mutableCopy() as! NSMutableArray
            tbl_List.reloadData()
            txt_Search.resignFirstResponder()
            return
        }
        txt_Search.resignFirstResponder()
        alertMsg(viewController: self, title: "Search Demo", message: "Enter atleast one character")
    }
    
    @IBAction func reset_Clicked(_ sender: Any) {
        txt_Search.text = ""
        txt_Search.resignFirstResponder()
        arr_Table = NSMutableArray()
        arr_Table = get_data_list()
        tbl_List.reloadData()
    }
    
    //MARK:- TABLEVIEW DELEGATE AND DATASOURCE
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_Table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tbl_list") as! CustomTableCell
        cell.selectionStyle = .none
        let dict_Details = arr_Table.object(at: indexPath.row) as! NSDictionary
        cell.lbl_Rank.text = "Rank #\(dict_Details.object(forKey: "Rank") as! String)"
        cell.lbl_Name.text = "Movie Name : \(dict_Details.object(forKey: "Name") as! String)".capitalized
        cell.lbl_Source.text = "Source : \(dict_Details.object(forKey: "Source") as! String)".capitalized
        cell.btn_WebLink.setTitle("Link : \(dict_Details.object(forKey: "WebLink") as! String)", for: .normal)
        cell.btn_WebLink.tag = indexPath.row+1000
        cell.lbl_Type.text = "Type : \(dict_Details.object(forKey: "Type") as! String)".capitalized
        cell.lbl_Year.text = "Year : \(dict_Details.object(forKey: "Year") as! String)".capitalized
        
        let str_bar_val = "\(dict_Details.object(forKey: "Rank") as! String)"
        if str_bar_val == "10" || str_bar_val == "9" || str_bar_val == "8" || str_bar_val == "7" {
            cell.view_Table.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        }
        else if str_bar_val == "6" || str_bar_val == "5" || str_bar_val == "4" {
            cell.view_Table.backgroundColor = UIColor.yellow.withAlphaComponent(0.1)
        }
        else if str_bar_val == "3" || str_bar_val == "2" || str_bar_val == "1" {
            cell.view_Table.backgroundColor = UIColor.green.withAlphaComponent(0.1)
        }
        else {
            cell.view_Table.backgroundColor = UIColor.clear
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //MARK:- WEBLINK CLICKED
    @IBAction func weblink(_ sender: UIButton) {
        txt_Search.resignFirstResponder()
        
        let tag_val = sender.tag
        print(tag_val)
        
        let dict_Details = arr_Table.object(at: tag_val-1000) as! NSDictionary
        let text_val = "\(dict_Details.object(forKey: "WebLink") as! String)"
        print(text_val)
        
        if #available(iOS 10, *){
            UIApplication.shared.open(URL(string: text_val)!, options: [:], completionHandler: nil)
        }else{
            UIApplication.shared.openURL(URL(string: text_val)!)
        }
    }
}

