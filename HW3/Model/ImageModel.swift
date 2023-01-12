//
//  ImageModel.swift
//  HW3
//
//  Created by emre can duygulu on 9.01.2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let imageModel = try? JSONDecoder().decode(ImageModel.self, from: jsonData)

import Foundation

// MARK: - ImageModel
struct ImageModel: Codable {
    let success: Bool
    let data: DataClass
    
}

// MARK: - DataClass
struct DataClass: Codable {
    let memes: [Meme]
}

// MARK: - Meme
struct Meme: Codable {
    let id, name: String
    let url: String
    let width, height: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case url = "url"
        case width = "width"
        case height = "height"
    }
}

