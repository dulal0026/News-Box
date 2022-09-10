//
//  ArticleTableCell.swift
//  GoodNews
//
//  Created by user on 10/9/22.
//

import UIKit

class ArticleTableCell: UITableViewCell {

    lazy var messageContainerView:MessageContainer = {
        let lbl:MessageContainer = MessageContainer(frame: .zero)
        return lbl
    }()
    
    lazy var dividerView:UIView = {
        let divider:UIView = UIView(frame: .zero)
        divider.backgroundColor = Colors.divider_color_gray.uiColor()
        return divider
    }()

    lazy var dateLabel:UILabel = {
        let lbl:UILabel = UILabel(frame: .zero)
        lbl.textColor = .darkGray
        lbl.numberOfLines = 1
        lbl.backgroundColor = .clear
        lbl.font = UIFont(name: "MyriadPro-Regular", size: 12.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupControls()
        messageContainerView.isUserInteractionEnabled = true
        let tapG:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapon(_:)))
        messageContainerView.addGestureRecognizer(tapG)
    }
    @objc func tapon(_ sender:UITapGestureRecognizer){
        print("Tap on")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupControls(){
        self.addSubview(messageContainerView)
        self.addSubview(dividerView)
        self.addSubview(dateLabel)
   
        messageContainerView.translatesAutoresizingMaskIntoConstraints = false
        messageContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true

        messageContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        messageContainerView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -8).isActive = true

        dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
       
        dateLabel.bottomAnchor.constraint(equalTo: messageContainerView.topAnchor, constant: -10).isActive = true

        dividerView.constraintsToBottom()
        dividerView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fill(_ model:ArticleViewModel){
        let sourceName = model.sourceName
        messageContainerView.fill(model.title,sourceName, model.desription)
        dateLabel.text = model.publishDate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}

class MessageContainer: UIView {
    
    lazy var titleLabel:UILabel = {
        let lbl:UILabel = UILabel(frame: .zero)
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        lbl.font = UIFont(name: "MyriadPro-Regular", size: 14.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var nameLabel:UILabel = {
        let lbl:UILabel = UILabel(frame: .zero)
        lbl.textColor = .black
        lbl.numberOfLines = 2
        lbl.backgroundColor = .clear
        lbl.font = UIFont(name: "MyriadPro-Regular", size: 12.0)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var messageLabel:UILabel = {
        let lbl:UILabel = UILabel(frame: .zero)
        lbl.textColor = .gray
        lbl.numberOfLines = 3
        lbl.backgroundColor = .clear
        lbl.font = UIFont(name: "MyriadPro-Regular", size: 12.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupControls()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        setupControls()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func commonInit() {
        backgroundColor = .clear
        layer.masksToBounds = false
    }
    func setupControls(){
        self.addSubview(titleLabel)
        self.addSubview(nameLabel)
        self.addSubview(messageLabel)
        
        titleLabel.text = "title"
        nameLabel.text = "name"
        messageLabel.text = "msg"

        
        let insets:UIEdgeInsets = UIEdgeInsets.zero
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: insets.left).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: insets.right).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: insets.top).isActive = true

        messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: insets.left).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: insets.right).isActive = true
        messageLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 6.0).isActive = true

        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: insets.left).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: insets.right).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.messageLabel.bottomAnchor, constant: 6.0).isActive = true

        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    func fill(_ title:String,_ name:String,_ msg:String){
        titleLabel.text = title
        nameLabel.text = name
        messageLabel.text = msg
    }
}
