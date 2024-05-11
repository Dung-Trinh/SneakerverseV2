enum BlogPostCategory: Identifiable {
    case fashion
    case sneaker
    case event
    
    init?(_ value: String) {
            switch value.lowercased() {
                case "fashion": self = .fashion
                case "sneaker": self = .sneaker
                case "event": self = .event
                default: return nil
            }
        }
    
    var id: Self {
        return self
    }
    
    var text : String {
        switch self {
            case .fashion:
                "👕 Fashion"
            case .sneaker:
                "👟 Sneakers"
            case .event:
                "🎫 Events"
        }
    }
}
