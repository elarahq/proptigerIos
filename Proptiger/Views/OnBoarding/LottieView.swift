import Foundation
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var name: String
    let completion: () -> Void
        var loopMode: LottieLoopMode = .loop

        func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
            let view = UIView(frame: .zero)

            let animationView = AnimationView()
            let animation = Animation.named(name)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .playOnce
            animationView.play { _ in
                completion()
            }

            animationView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(animationView)
            NSLayoutConstraint.activate([
                animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
                animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])

            return view
        }

        func updateUIView(_ uiView: UIViewType, context: Context) {
        }
}
