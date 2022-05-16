import UIKit

extension OrdersCell {
    func setupUI() {
        backgroundColor = UIColor(hexString: "#FBFAFD")
        setupLayout()
        containerView.shadowEffect(color: UIColor.black.withAlphaComponent(0.1))
    }
    
    private func setupLayout() {
        contentView.addSubview(containerView)
        containerView.addSubview(orderLabel)
        containerView.addSubview(timeLable)
        containerView.addSubview(p1Image)
        containerView.addSubview(p1titleLabel)
        containerView.addSubview(p1priceLabel)
        containerView.addSubview(p1quantityLabel)
        containerView.addSubview(p2Image)
        containerView.addSubview(p2titleLabel)
        containerView.addSubview(p2priceLabel)
        containerView.addSubview(p2quantityLabel)
        containerView.addSubview(chatButton)
        containerView.addSubview(orderDetailsButton)
    
        containerView.anchors(top: topAnchor,
                              topConstants: 20,
                              leading: leadingAnchor,
                              leadingConstants: 20,
                              bottom: bottomAnchor,
                              bottomConstants: -20,
                              trailing: trailingAnchor,
                              trailingConstants: -10)
        
        orderLabel.anchors(top: containerView.topAnchor,
                           topConstants: 20,
                           leading: containerView.leadingAnchor,
                           leadingConstants: 20,
                           trailing: p1priceLabel.leadingAnchor,
                           trailingConstants: -5)
        timeLable.anchors(top: orderLabel.topAnchor,
                           trailing: containerView.trailingAnchor,
                           trailingConstants: -20)
        p1Image.anchors(top: orderLabel.bottomAnchor,
                             topConstants: 20,
                             leading: orderLabel.leadingAnchor,
                             heightConstants: 60,
                             widthConstants: 60)
        p1titleLabel.anchors(top: p1Image.topAnchor,
                           leading: p1Image.trailingAnchor,
                           leadingConstants: 20,
                           trailing: p1priceLabel.leadingAnchor,
                           trailingConstants: -5)
        p1priceLabel.anchors(top: p1titleLabel.topAnchor,
                           leading: p1titleLabel.trailingAnchor,
                           leadingConstants: 5,
                           trailing: timeLable.trailingAnchor)
        p1quantityLabel.anchors(top: p1titleLabel.bottomAnchor,
                              topConstants: 5,
                              leading: p1titleLabel.leadingAnchor,
                              trailing: p1titleLabel.trailingAnchor)
        p2Image.anchors(top: p1Image.bottomAnchor,
                             topConstants: 20,
                             leading: orderLabel.leadingAnchor,
                             heightConstants: 60,
                             widthConstants: 60)
        p2titleLabel.anchors(top: p2Image.topAnchor,
                           leading: p2Image.trailingAnchor,
                           leadingConstants: 20,
                           trailing: p2priceLabel.leadingAnchor,
                           trailingConstants: -5)
        p2priceLabel.anchors(top: p2titleLabel.topAnchor,
                           leading: p2titleLabel.trailingAnchor,
                           leadingConstants: 5,
                           trailing: timeLable.trailingAnchor)
        p2quantityLabel.anchors(top: p2titleLabel.bottomAnchor,
                              topConstants: 5,
                              leading: p2titleLabel.leadingAnchor,
                              trailing: p2titleLabel.trailingAnchor)
        orderDetailsButton.anchors(top: p2Image.bottomAnchor,
                                   topConstants: 20,
                                   leading: p2Image.leadingAnchor,
                                   heightConstants: 40,
                                   widthConstants: 150)
        chatButton.anchors(top: p2Image.bottomAnchor,
                                   topConstants: 20,
                                   leading: orderDetailsButton.trailingAnchor,
                                   leadingConstants: 20,
                                   heightConstants: 40,
                                   widthConstants: 150)
        
    }
}
