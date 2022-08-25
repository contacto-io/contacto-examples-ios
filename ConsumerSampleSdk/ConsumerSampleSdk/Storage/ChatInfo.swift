public struct ChatInfo: Codable {
    let appId: String
    let appKey: String
}

struct UserInfo: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let phoneNumber: String
}
