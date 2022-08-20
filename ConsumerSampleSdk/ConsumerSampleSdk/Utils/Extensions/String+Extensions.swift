import Foundation
 
extension String {
    func encoded() -> String {
        let excludedCharacters = "-._~/?:=", allowedCharacters = NSMutableCharacterSet.alphanumeric()
        allowedCharacters.addCharacters(in: excludedCharacters)
        return addingPercentEncoding(withAllowedCharacters: allowedCharacters as CharacterSet) ?? ""
      }
    
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+00:00")
        let date = dateFormatter.date(from: self)
        return date
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
