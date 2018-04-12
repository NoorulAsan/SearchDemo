//
//  CustomTableCell.swift
//  SearchDemo
//
//  Created by MacMini on 12/02/18.
//  Copyright © 2018 MacMini. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {

    @IBOutlet var view_Table : UIView!
    @IBOutlet var lbl_Rank : UILabel!
    @IBOutlet var lbl_Name : UILabel!
    @IBOutlet var lbl_Source : UILabel!
    @IBOutlet var btn_WebLink : UIButton!
    @IBOutlet var lbl_Type : UILabel!
    @IBOutlet var lbl_Year : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
