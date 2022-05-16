import UIKit

class CustomerServiceHeader: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTitle()
    }
    
    private func setupTitle() {
        addSubview(titleLabel)
        titleLabel.anchors(top: topAnchor,
                           leading: leadingAnchor,
                           leadingConstants: 10,
                           bottom: bottomAnchor,
                           bottomConstants: -10,
                           trailing: trailingAnchor,
                           trailingConstants: -20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
