//
//  CellView.swift
//  HW3
//
//  Created by emre can duygulu on 9.01.2023.
//

import UIKit

class CellView: UICollectionViewCell {
    static let id = "id"
    
    lazy var name = makeLabel(font: .boldSystemFont(ofSize: 18))
    
    private var memeView: UIImageView = {
        let memeView = UIImageView()
        memeView.clipsToBounds = true
        memeView.contentMode = .scaleAspectFill
        return memeView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(memeView)
        NSLayoutConstraint.activate([
            memeView.topAnchor.constraint(equalTo: self.topAnchor),
            memeView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            memeView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            memeView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        memeView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(name)
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: memeView.bottomAnchor, constant: 5),
            name.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            name.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            name.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        name.translatesAutoresizingMaskIntoConstraints = false
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeLabel(font: UIFont) -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = font
        return label
    }
}

extension CellView {
    func populate(with memes: Meme) {
        name.text = memes.name
        memeView.loadFrom(URLAddress: memes.url)
        
        NSLayoutConstraint.activate([
            memeView.heightAnchor.constraint(equalToConstant: CGFloat(memes.height))
        ])
    }
}
