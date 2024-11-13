//
//  FileManager + Extensions.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 12/11/2024.
//

import Foundation

extension FileManager {
    enum FilemanagerError: Error {
        case saveError
        case readError
        case decodingError
        case encodingError
    }
    static var docDirURL: URL {
        return Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    func saveDocument(contents: String, docName: String) throws {
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            throw FilemanagerError.saveError
        }
    }

    func readDocument(docName: String) throws -> Data {
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw FilemanagerError.readError
        }
    }

    func docExist(named docName: String) -> Bool {
        fileExists(atPath: Self.docDirURL.appendingPathComponent(docName).path)
    }
}
