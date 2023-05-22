//
//  ViewController.swift
//  8 Task
//
//  Created by Руслан Гайфуллин on 22.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle.fill")
        image.tintColor = .lightGray
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Avatar"
        view.addSubview(scrollView)
        setupConstraits()
        
        
        DispatchQueue.main.async {
            guard let UINavigationLargeTitleView = NSClassFromString("_UINavigationBarLargeTitleView") else { return }
            
            self.navigationController?.navigationBar.subviews.forEach { subview in
                if subview.isKind(of: UINavigationLargeTitleView.self) {
                    let viewAvatar = self.avatarImageView
                    viewAvatar.clipsToBounds = true
                    subview.addSubview(viewAvatar)
                    viewAvatar.translatesAutoresizingMaskIntoConstraints = false
                    
                    NSLayoutConstraint.activate([
                        viewAvatar.rightAnchor.constraint(equalTo: subview.rightAnchor, constant: -15),
                        viewAvatar.bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: -12),
                        viewAvatar.heightAnchor.constraint(equalToConstant: 36),
                        viewAvatar.widthAnchor.constraint(equalToConstant: 36)
                    ])
                    
                }
            }
            
        }
    }
    
    
    private func setupConstraits() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
   

}
