import UIKit

class MostSearchedCell: UITableViewCell {
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    lazy var frontButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Front"), for: .normal)
        button.isUserInteractionEnabled = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setupTitle()
        backgroundColor = UIColor(hexString: "#FBFAFD")
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitle() {
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(frontButton)
        containerView.anchors(top: contentView.topAnchor,
                              topConstants: 10,
                              leading: contentView.leadingAnchor,
                              leadingConstants: 20,
                              bottom: contentView.bottomAnchor,
                              trailing: contentView.trailingAnchor,
                              trailingConstants: -20)
        titleLabel.anchors(top: containerView.topAnchor,
                           topConstants: 10,
                           leading: containerView.leadingAnchor,
                           leadingConstants: 6,
                           trailing: containerView.trailingAnchor,
                           trailingConstants: -20)
        frontButton.anchors(trailing: containerView.trailingAnchor,
                            trailingConstants: -10,
                            heightConstants: 10,
                            widthConstants: 10,
                            centerY: titleLabel.centerYAnchor)
    }
    
    func updateContent(data: MostSearchedInfo) {
        titleLabel.text = data.title
    }
}
