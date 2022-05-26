import Foundation
import SwiftUI

enum ModalState: CGFloat {
    
    case closed ,onThreeFourthRevealed, halfRevealed, open
    
    func offsetFromTop() -> CGFloat {
        switch self {
        case .closed:
            return UIScreen.main.bounds.height
        case .onThreeFourthRevealed:
            return UIScreen.main.bounds.height * 1/4
        case .halfRevealed:
            return UIScreen.main.bounds.height * 1/2
        case .open:
            return 0
        }
    }
}

struct Modal {
    var position: ModalState  = .closed
    var dragOffset: CGSize = .zero
    var content: AnyView?
}
