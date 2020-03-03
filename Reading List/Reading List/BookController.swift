//
//  BookController.swift
//  Reading List
//
//  Created by krikaz on 3/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    var books: [Book] = []
    
    var readingListURL: URL? {
        get {
            guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            let readingListURL = documentsDirectory.appendingPathComponent("ReadingList.plist")
            return readingListURL
        }
    }
    
    func saveToPersistenStore() {
        guard let fileURL = readingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let booksData = try encoder.encode(books)
            try booksData.write(to: fileURL)
        } catch {
            print("Error encoding books array: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let fileURL = readingListURL else { return }
        do {
            let booksData = try Data(contentsOf: fileURL)
            let decoder = PropertyListDecoder()
            let decodedBooks = try decoder.decode([Book].self, from: booksData)
            books = decodedBooks
        } catch {
            print("Error decoding or loading books: \(error)")
        }
    }
    
    func createBook(title: String, reason: String){
        let newBook = Book(title: title, reasonToRead: reason)
        books.append(newBook)
        saveToPersistenStore()
    }
    
    func deleteBook(this book: Book) {
        if let index = books.firstIndex(of: book) {
            books.remove(at: index)
            saveToPersistenStore()
        }
    }
    
    func updateHasBeenRead(for book: Book) {
        if let index = books.firstIndex(of: book) {
            books[index].hasBeenRead.toggle()
            saveToPersistenStore()
        }
    }
    
    func updateBook(book: Book, title: String, reason: String) {
        guard let index = books.firstIndex(of: book) else { return }
        var updatedBook = book
        updatedBook.title = title
        updatedBook.reasonToRead = reason
        books.remove(at: index)
        books.insert(book, at: index)
        saveToPersistenStore()
    }
    
    var readBooks: [Book] {
        get {
            return books.filter { $0.hasBeenRead == true }
        }
    }
    
    var unreadBooks: [Book] {
        get {
            return books.filter { $0.hasBeenRead == false }
        }
    }
}

