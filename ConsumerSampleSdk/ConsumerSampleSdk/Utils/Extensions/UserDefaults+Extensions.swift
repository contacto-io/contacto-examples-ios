import Foundation

extension UserDefaults {
    
    var contactoInitInfo: ChatInfo {
        get {
            getInfo(with: "Contact.Info")
        }
        
        set {
            store(with: newValue)
        }
        
    }
    
    private func getInfo(with key: String) -> ChatInfo {
        do {
            guard let data = UserDefaults.standard.data(forKey: key) else {
                return .init(appId: "", appKey: "", mobileNumber: "", email: "")
            }
            return try JSONDecoder().decode(ChatInfo.self, from: data)
        } catch {
            return .init(appId: "", appKey: "", mobileNumber: "", email: "")
        }
    }
    
    private func store(with info: ChatInfo) {
        let data = try? JSONEncoder().encode(info)
        UserDefaults.standard.set(data, forKey: "Contact.Info")
    }
}
