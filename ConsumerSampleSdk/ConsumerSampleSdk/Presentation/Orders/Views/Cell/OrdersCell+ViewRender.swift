import UIKit

extension OrdersCell {
    func updateContent(data: OrderInfo) {
        orderLabel.text = data.orderInfo
        timeLable.text = data.timeInfo
        p1Image.image = UIImage(named: data.p1Image)
        p1priceLabel.text = data.p1Price
        p1titleLabel.text = data.p1eTitle
        p1quantityLabel.text = data.p1Qty
        p2Image.image = UIImage(named: data.p2Image)
        p2priceLabel.text = data.p2Price
        p2titleLabel.text = data.p2eTitle
        p2quantityLabel.text = data.p2Qty
    }
}
