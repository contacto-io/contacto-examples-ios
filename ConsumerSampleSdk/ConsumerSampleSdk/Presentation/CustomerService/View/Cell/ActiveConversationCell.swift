import UIKit

class ActiveConversationCell: UITableViewCell {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var activeView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 3
        return view
    }()
    
    lazy var timeLable: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .right
        return label
    }()
    
    lazy var activeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.text = "Active"
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    lazy var orderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .link
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setupSubviews()
        backgroundColor = UIColor(hexString: "#FBFAFD")
        setupConstraints()
        selectionStyle = .none
    }
    
    private func setupSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(activeView)
        containerView.addSubview(activeLabel)
        containerView.addSubview(timeLable)
        containerView.addSubview(titleLabel)
        containerView.addSubview(orderLabel)
        containerView.shadowEffect(color: UIColor.black.withAlphaComponent(0.1))
    }
    
    private func setupConstraints() {
        containerView.anchors(top: topAnchor,
                              topConstants: 10,
                              leading: leadingAnchor,
                              leadingConstants: 20,
                              bottom: bottomAnchor,
                              bottomConstants: -10,
                              trailing: trailingAnchor,
                              trailingConstants: -20)
        activeView.anchors(top: containerView.topAnchor,
                           topConstants: 20,
                           leading: containerView.leadingAnchor,
                           leadingConstants: 20,
                           heightConstants: 6,
                           widthConstants: 6)
        activeLabel.anchors(leading: activeView.trailingAnchor,
                            leadingConstants: 6,
                            widthConstants: 50,
                            centerY: activeView.centerYAnchor)
        timeLable.anchors(leading: activeLabel.trailingAnchor,
                          leadingConstants: 20,
                          trailing: containerView.trailingAnchor,
                          trailingConstants: -20,
                          centerY: activeView.centerYAnchor)
        titleLabel.anchors(top: activeView.bottomAnchor,
                           topConstants: 20,
                           leading: activeView.leadingAnchor,
                           trailing: timeLable.trailingAnchor)
        orderLabel.anchors(top: titleLabel.bottomAnchor,
                           topConstants: 10,
                           leading: titleLabel.leadingAnchor,
                           trailing: titleLabel.trailingAnchor)
    }
    
    func updateContent(data: ActiveConversationsInfo) {
        titleLabel.text = data.title
        orderLabel.text = data.orderInfo
        timeLable.text = data.timeInfo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
