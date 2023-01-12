//
//  ImageViewModel.swift
//  HW3
//
//  Created by emre can duygulu on 9.01.2023.
//
// https://api.imgflip.com/get_memes

import Foundation

class ImageViewModel {
    
    var memes: [Meme] = [Meme]()
    var output: ImageViewModelOutput?
    
    func fetchMemes() {
        output?.isLoading(true)
        
        guard let url = URL(string: "https://api.imgflip.com/get_memes") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("URLSession error: \(error.localizedDescription)")
                self.output?.showError("Error")
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(ImageModel.self, from: data)
                    DispatchQueue.main.async {
                        self.memes = result.data.memes
                        self.output?.isLoading(false)
                        self.output?.showData()
                    }
                } catch {
                    print("Decoding error")
                    self.output?.isLoading(false)
                    self.output?.showError("Error")
                }
            }
        }.resume()
    }
}

protocol ImageViewModelInput {
    func loadMemes()
}

protocol ImageViewModelOutput {
    func showData()
    func showError(_ errorMessage: String)
    func isLoading(_ value: Bool)
}

extension ImageViewModel: ImageViewModelInput {
    func loadMemes() {
        fetchMemes()
    }
}
