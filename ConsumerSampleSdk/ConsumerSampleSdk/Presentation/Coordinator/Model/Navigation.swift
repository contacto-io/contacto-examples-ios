public struct Navigation {
    public let position: Position
    
    public init(position: Position = .pushOnExistingModule) {
        self.position = position
    }
}
