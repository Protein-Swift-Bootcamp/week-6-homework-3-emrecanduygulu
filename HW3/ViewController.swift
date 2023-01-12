//
//  ViewController.swift
//  HW3
//
//  Created by emre can duygulu on 9.01.2023.
//

import UIKit

class ViewController: UIViewController, ImageViewModelOutput, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CellView = collectionView.dequeueReusableCell(withReuseIdentifier: CellView.id, for: indexPath) as! CellView
        let memes = viewModel.memes[indexPath.row]
        cell.populate(with: memes)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - gridLayout.minimumInteritemSpacing
        let memes = viewModel.memes[indexPath.row].height
        return CGSize(width:widthPerItem, height: CGFloat(memes))
    }

    func showData() {
        viewSource.collectionView.reloadData()
        print("success")
    }
    
    func showError(_ errorMessage: String) {
        print(errorMessage)
    }
    
    func isLoading(_ value: Bool) {
        print(true)
    }
    
    private lazy var viewSource = ListView()
    
    private let viewModel = ImageViewModel()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = viewSource
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewSource.collectionView.delegate = self
        viewSource.collectionView.dataSource = self
        viewModel.output = self
        
        viewModel.loadMemes()
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionview(_ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CellView = collectionView.dequeueReusableCell(withReuseIdentifier: CellView.id, for: indexPath) as! CellView
        let memes = viewModel.memes[indexPath.row]
        cell.populate(with: memes)
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}
