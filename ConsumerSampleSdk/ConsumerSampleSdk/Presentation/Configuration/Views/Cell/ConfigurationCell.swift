import UIKit

class ConfigurationCell: UITableViewCell {
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    lazy var seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        return view
    }()
    
    lazy var switchButton: UISwitch = {
        let button = UISwitch()
        button.isOn = true
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = UIColor(hexString: "#FBFAFD")
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        contentView.addSubview(seperatorView)
        contentView.addSubview(switchButton)
        
        titleLabel.anchors(leading: leadingAnchor,
                           leadingConstants: 20,
                           trailing: switchButton.leadingAnchor,
                           trailingConstants: -5,
                           centerY: contentView.centerYAnchor)
        switchButton.anchors(trailing: trailingAnchor,
                             trailingConstants: -20,
                             heightConstants: 30,
                             widthConstants: 40,
                             centerY: titleLabel.centerYAnchor)
        seperatorView.anchors(leading: leadingAnchor,
                              leadingConstants: 10,
                              bottom: bottomAnchor,
                              bottomConstants: 0,
                              trailing: trailingAnchor,
                              trailingConstants: -10,
                              heightConstants: 1)
    }
    
    func setupContent(item: ConfigurationInfo, isLast: Bool) {
        titleLabel.text = item.title
        seperatorView.isHidden = isLast
        switch item.actionType {
        case .detail:
            switchButton.isHidden = true
            accessoryType = .disclosureIndicator
        case .switch:
            switchButton.isHidden = false
            accessoryType = .none
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
