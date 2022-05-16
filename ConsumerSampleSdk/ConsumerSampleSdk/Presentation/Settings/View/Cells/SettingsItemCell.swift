import UIKit

class SettingsItemCell: UITableViewCell {
    lazy var icon: UIButton = {
        let imageView = UIButton()
        imageView.backgroundColor = UIColor.orange.withAlphaComponent(0.4)
        imageView.layer.cornerRadius = 10
        imageView.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = UIColor(hexString: "#FBFAFD")
        selectionStyle = .none
        contentView.addSubview(icon)
        contentView.addSubview(titleLabel)
        
        icon.anchors(top: topAnchor,
                     topConstants: 10,
                     leading: leadingAnchor,
                     leadingConstants: 10,
                     heightConstants: 30,
                     widthConstants: 30)
        titleLabel.anchors(leading: icon.trailingAnchor,
                           leadingConstants: 20,
                           trailing: trailingAnchor,
                           trailingConstants: -40,
                           centerY: icon.centerYAnchor)
    }
    
    func setupContent(item: SettingsItems) {
        icon.setImage(UIImage(named: item.icon)?.withRenderingMode(.alwaysTemplate), for: .normal)
        icon.imageView?.tintColor = .orange
        titleLabel.text = item.title
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}

