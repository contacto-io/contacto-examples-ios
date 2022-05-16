enum SettingsItems: CaseIterable {
    case customerService
    case configuration
    
    var title: String {
        switch self {
        case .configuration:
            return "Configurations"
        case .customerService:
            return "Customer Service"
        }
    }
    
    var icon: String {
        switch self {
        case .configuration:
            return "Config"
        case .customerService:
            return "Message"
        }
    }
}
