import Foundation
import SwiftUI
import Lottie

struct Splash: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
            if self.isActive {
                Onboarding()
            } else {
                LottieView(name: "splash") {
                    self.isActive = true
                }
            }
        }
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
