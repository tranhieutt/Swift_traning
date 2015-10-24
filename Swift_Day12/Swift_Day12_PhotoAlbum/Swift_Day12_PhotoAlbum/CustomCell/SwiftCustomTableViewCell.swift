//
//  SwiftCustomTableViewCell.swift
//  Swift_Day09
//
//  Created by TUYENBQ on 10/19/15.
//  Copyright © 2015 TUYENBQ. All rights reserved.
//

import UIKit

class SwiftCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePhotoAlbumThumbnail: UIImageView!
    @IBOutlet weak var fileNameCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setTitleForCell(fileName:String) (){
        self.fileNameCell.text = fileName
        
        
    }
    
}
