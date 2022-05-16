import UIKit

extension UIView {
    
    var safeAreaBottom: CGFloat {
        return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
    }
    
    var safeAreaTop: CGFloat {
        return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
    }
    
    func anchors(top: NSLayoutYAxisAnchor? = nil, topConstants: CGFloat = 0.0, leading: NSLayoutXAxisAnchor? = nil, leadingConstants: CGFloat = 0.0, bottom: NSLayoutYAxisAnchor? = nil, bottomConstants: CGFloat = 0.0, trailing: NSLayoutXAxisAnchor? = nil, trailingConstants: CGFloat = 0.0, heightConstants: CGFloat = 0.0, widthConstants: CGFloat = 0.0, centerX: NSLayoutXAxisAnchor? = nil, centerXConstants: CGFloat = 0.0, centerY: NSLayoutYAxisAnchor? = nil, centerYConstants: CGFloat = 0.0 ) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstants).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: leadingConstants).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: bottomConstants).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: trailingConstants).isActive = true
        }
        if heightConstants > 0 {
            heightAnchor.constraint(equalToConstant: heightConstants).isActive = true
        }
        if widthConstants > 0 {
            widthAnchor.constraint(equalToConstant: widthConstants).isActive = true
        }
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX, constant: centerXConstants).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY, constant: centerYConstants).isActive = true
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func shadowEffect(color: UIColor?, size: CGSize = CGSize(width: 0.0, height: 2.0), radius: CGFloat = 6.0) {
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = size
        self.layer.shadowRadius = radius
        self.layer.shadowColor = color?.cgColor ?? UIColor(red: 155.0/225.0, green: 155.0/225.0, blue: 155.0/225.0, alpha: 0.6).cgColor
        self.layer.masksToBounds = false
    }
}
