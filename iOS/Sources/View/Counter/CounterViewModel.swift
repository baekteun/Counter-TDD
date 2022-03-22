import Combine

enum CheckResults {
    case lower, equal, higher
}
final class CounterViewModel: ObservableObject {
    @Published var count: Int = 0
    
    var secret = Int.random(in: -100...100)
    var checkResults: CheckResults {
        if count > secret { return .higher }
        else if count < secret { return .lower}
        return .equal
    }
    
    enum Input{
        case plusButtonDidTap
        case minusButtonDidTap
        case resetButtonDidTap
    }
    
    func apply(_ input: Input) {
        switch input {
        case .plusButtonDidTap:
            count += 1
        case .minusButtonDidTap:
            count -= 1
        case .resetButtonDidTap:
            count = 0
            secret = Int.random(in: -100...100)
        }
    }
}
