import Foundation
import SwiftUI

class OnboardingViewModal: ObservableObject {
    
    @Published var errorMessage: String?        
    @Published var borderColor: Color = .black
    @Published var isTextFieldDisabled = false
    var successCompletionHandler: (()->())?
    @Published var showResendText = false
    
}
