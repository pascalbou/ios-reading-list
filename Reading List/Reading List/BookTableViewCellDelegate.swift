//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by krikaz on 3/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate {
    func toggleHasBeenRead(for cell: BookTableViewCell)
}
