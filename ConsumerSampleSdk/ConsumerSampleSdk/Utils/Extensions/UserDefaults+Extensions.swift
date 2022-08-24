import Foundation

extension UserDefaults {

    var userInfo: UserInfo {
        get {
            getInfo(with: "Contact.UserInfo") ?? UserInfo(name: "Ketan Somvanshi", email: "ketan.somvanshi@plivo.com", phoneNumber: "919986486551")
        }
        
        set {
            store(with: newValue, key: "Contact.UserInfo")
        }
    }
    
    var contactoInitInfo: ChatInfo {
        get {
            getInfo(with: "Contact.Info") ?? .init(appId: "", appKey: "")
        }
        
        set {
            store(with: newValue, key: "Contact.Info")
        }
        
    }
    
    private func getInfo<T: Codable>(with key: String) -> T?{
        do {
            guard let data = UserDefaults.standard.data(forKey: key) else {
                return nil
            }
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            return nil
        }
    }
    
    private func store<T: Codable>(with info: T, key: String) {
        let data = try? JSONEncoder().encode(info)
        UserDefaults.standard.set(data, forKey: key)
    }
}
