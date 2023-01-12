//
//  ListView.swift
//  HW3
//
//  Created by emre can duygulu on 12.01.2023.
//

import UIKit

class ListView: UIView {
    
    lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        cView.register(CellView.self, forCellWithReuseIdentifier: CellView.id)
        cView.translatesAutoresizingMaskIntoConstraints = false
        return cView
    }()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
