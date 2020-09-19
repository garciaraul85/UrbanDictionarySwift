//
//  WordItemTableViewCell.swift
//  UrbanDictionary
//
//  Created by Saulo Garcia on 9/19/20.
//

import UIKit

class WordItemTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionOutlet: UILabel!
    @IBOutlet weak var thumbsUp: UILabel!
    @IBOutlet weak var thumbsDown: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
