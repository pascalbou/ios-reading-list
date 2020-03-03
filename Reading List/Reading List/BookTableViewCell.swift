//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by krikaz on 3/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    var book: Book?
    var delegate: BookTableViewCellDelegate?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var readUnreadButton: UIButton!
    
    @IBAction func readUnreadAction(_ sender: Any) {
        delegate?.toggleHasBeenRead(for: self)
    }
    
    func updateViews() {
        titleLabel.text = book?.title
        if book?.hasBeenRead == true {
            readUnreadButton.setImage(UIImage(named: "checked"), for: .normal)
        } else {
            readUnreadButton.setImage(UIImage(named: "unchecked"), for: .normal)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
