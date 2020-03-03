//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by krikaz on 3/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var bookController: BookController?
    var book: Book?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var reasonTextView: UITextView!
    
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        guard let title = book?.title, let reason = book?.reasonToRead else { return }
        if let unwrappedBook = book {
            bookController?.updateBook(book: unwrappedBook, title: title, reason: reason)
        } else {
            bookController?.createBook(title: title , reason: reason)
        }
        
        
    }
    
    func updateViews() {
        if book != nil {
            titleTextField.text = book?.title
            reasonTextView.text = book?.reasonToRead
            self.title = book?.title
        } else {
            self.title = "Add a new book"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
