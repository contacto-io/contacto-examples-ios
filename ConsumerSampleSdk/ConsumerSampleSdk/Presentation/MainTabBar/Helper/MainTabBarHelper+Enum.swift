enum TabBarScreens: String, Codable {
    case home
    case organizer
    case cart
    case settings

    func getTabBarImage(isSelectedImage: Bool) -> String? {
        switch self {
        case .home:
            return isSelectedImage ? "home_selected" : "home_notselected"
        case .organizer:
            return isSelectedImage ? "organiser_selected" : "organiser_notselected"
        case .cart:
            return isSelectedImage ? "cart_selected" : "cart_notselected"
        case .settings:
            return isSelectedImage ? "settings_selected" : "settings_notselected"
        }
    }
}
