//
//  ArticleDetailsVC.swift
//  GoodNews
//
//  Created by user on 11/9/22.
//

import UIKit

class ArticleDetailsVC: ScrollBaseVC {

    var viewModel:ArticleDetailsViewModel
       
    init(_ viewModel: ArticleDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("")
    }
    lazy var titleLabel:UILabel = {
        let lbl:UILabel = UILabel(frame: .zero)
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        lbl.font = UIFont(name: "MyriadPro-Regular", size: 14.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var dateLabel:UILabel = {
        let lbl:UILabel = UILabel(frame: .zero)
        lbl.textColor = .darkGray
        lbl.numberOfLines = 1
        lbl.backgroundColor = .clear
        lbl.font = UIFont(name: "MyriadPro-Regular", size: 12.0)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var newsImageView:UIImageView = {
        let avtImgV = UIImageView(frame: .zero)
        avtImgV.layer.borderWidth = 1
        avtImgV.clipsToBounds = true
        avtImgV.contentMode = .scaleAspectFill
        avtImgV.translatesAutoresizingMaskIntoConstraints = false
        return avtImgV
    }()
    
    lazy var messageContainerView:MessageContainer = {
        let lbl:MessageContainer = MessageContainer(frame: .zero)
        lbl.messageLabel.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupControls()
        fill(viewModel.articleVM)
    }
    
    func setupControls(){
        self.containerView.addSubview(dateLabel)
        self.containerView.addSubview(titleLabel)
        self.containerView.addSubview(newsImageView)
        self.containerView.addSubview(messageContainerView)
   
        dateLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 12).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 10).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -10).isActive = true

        titleLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10).isActive = true

        newsImageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 0).isActive = true
        newsImageView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 0).isActive = true
        newsImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true

        messageContainerView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 10).isActive = true
        messageContainerView.trailingAnchor.constraint(lessThanOrEqualTo: self.containerView.trailingAnchor, constant: -10).isActive = true
        messageContainerView.topAnchor.constraint(equalTo: self.newsImageView.bottomAnchor, constant: 8).isActive = true
        messageContainerView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -16).isActive = true
    }
    
    func fill(_ vm:ArticleViewModel) {
        dateLabel.text = vm.publishDate
        titleLabel.text = vm.title
        messageContainerView.fill("",vm.sourceName, vm.desription)
       
        DispatchQueue.global(qos: .userInitiated).async {
            guard let url = URL(string: vm.imageUrlStr) else {
                return
            }
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            DispatchQueue.main.async {
                self.newsImageView.image = UIImage(data: data)
            }
        }
    }
}


class ScrollBaseVC: UIViewController {
    lazy var scrollView: UIScrollView = {
        let scrollView:UIScrollView = UIScrollView(frame: .zero)
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()
    lazy var containerView:UIView = {
        let view:UIView = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupContents()
    }
}

extension ScrollBaseVC{
    func setupContents(){
        self.view.addSubview(scrollView)
        scrollView.addSubview(containerView)
  
        let insets: UIEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.right).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: insets.top).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: insets.bottom).isActive = true
        
        let inset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: inset.left).isActive = true
        containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: inset.right).isActive = true
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: inset.top).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: inset.bottom).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}
