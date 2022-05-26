import Foundation
import SwiftUI

struct SkipButton: View {
    var body: some View {
        Button(action: {
            print("Hello World")
        }) {
            Text("Skip")
                .font(.system(size: 14))
                .foregroundColor(Color(hex: "#FF7F00"))
        }
        .padding(.trailing, 24.0)
        .frame(width: 54, height: 20)
    }
}

struct Info: View {
    
    var step: Int
    let title: [String] = ["No brokerage fee", "Always by your side", "All-in-one App"]
    let subtitle: [String] = ["The only thing we ask for is your happiness", "Get a personal property expert to guide you through every step", "Scheduling meetings to virtual site visits, everything in one click"]
    
    var body: some View {
        
        HStack {
            Text(title[step])
                .fontWeight(.medium)
                .font(.system(size: 22))
                .foregroundColor(Color(hex: "#222222"))
                .padding([.top, .leading], 22.0)
            Spacer()
            }
        HStack {
            Text(subtitle[step])
                .font(.system(size: 16))
                .foregroundColor(Color(hex: "#747474"))
                .lineLimit(3)
                .padding([.leading], 22.0)
                .padding([.top, .bottom], 10.0)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
        }
    }
}

struct BottomSection: View {
    
    var step: Int
    var onClick: () -> Void
    
    var body: some View {
        HStack {
            Image("dot\(step)")
                .resizable()
                .frame(width: 51, height: 6)
            Spacer()
            Button(action: onClick) {
                Text("Next")
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding([.horizontal], 42.0)
                    .padding([.vertical], 12.0)
            }
            .background(Color(hex: "#FF7F00"))
            .frame(width: 118, height: 42)
            .cornerRadius(8.0)
        }
        .padding(.horizontal, 24.0)
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxHeight: 108)
    }
}

struct Onboarding: View {

    @State private var step = 1
    
    @EnvironmentObject var modalManager: ModalManager
    @StateObject private var model = OnboardingViewModal()
    
        var body: some View {
            
            GeometryReader(content: { geometry in
            VStack {
                HStack {
                    Spacer()
                    SkipButton()
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxHeight: 50)
                
                TabView(selection: $step) {
                    ForEach((0..<3), id: \.self) { index in
                        VStack {
                            Image("onboarding\(step)")
                            .resizable()
                            .frame(width: geometry.size.width, height: geometry.size.width)
                            .background(Color.green)
                            Info(step: self.step - 1)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                Spacer()
                BottomSection(step: step) {
                    self.modalManager.openModal()
//                    if(self.step == 3) {
//
//                    } else {
//                        self.step = self.step + 1
//                    }
                }
            }
            .onAppear {
//                model.loginWithNumber {
//                    
//                }
                self.modalManager.newModal(position: .closed) {
//                    LoginModal()
                    OTPModal(model: model)
                }
            }
        })
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
      Onboarding()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
