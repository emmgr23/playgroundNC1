
import Foundation
import SwiftUI
import AVFoundation


//MARK: - Chapter 1:
public struct Chapter1: View {
    
    public init() {}
    
    @State var toSay = "once upon a time, a scientist while working in his astronomic lab, looking on telescope, finds out..."
    
    @State var progressPercentBar: Double = 0
    
    public func speak() {
        let voice = AVSpeechSynthesisVoice(language: "en-en")
        let tosay = AVSpeechUtterance(string: toSay)
        tosay.voice = voice
        let spk = AVSpeechSynthesizer()
        spk.speak(tosay)
    }
    
    public var body: some View {
        
        NavigationView {
            VStack {
               
                ThinkingView()
                    .frame(width: 200, height: 200)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                               speak()
                            }
                    }
                Spacer()
                NavigationLink(
                    destination: Chapter2(),
                    label: {
                        HStack() {
                            Spacer()
                            Spacer()
                            Text("Next Chapter: 2")
                                .foregroundColor(.blue)
                            Spacer()
                            ProgressBar(progressPercentBar)
                                .frame(width: 130, height: 130)
                        }
                    })
            }
        }
        .frame(width: 600, height: 650)
    }

}




//MARK: - animation image test


struct ThinkingView: View {
    
    @State private var myImage = Image(uiImage: UIImage(named: "i1.png")!)
    @State private var count = 0
    private let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    let imageNames: [String] = ["i1.png", "i2.png", "i3.png", "i4.png", "i5.png", "i6.png", "i7.png", "i8.png","i9.png","i10.png", "i11.png", "i12.png", "i13.png", "i14.png", "i15.png", "i16.png", "i17.png"]
    
    
    //    func animatedImage() {
    //    }
    
    var body: some View {
        myImage
            .onReceive(timer) { time in
                myImage = Image(uiImage: UIImage(named: imageNames[count])!)
                if count != imageNames.count - 1 {
                    count += 1
                }
            }
    }
}

private class Counter: ObservableObject {
    private var timer: Timer?
    
    @Published var value: Int = 0
    
    init(interval: Double) {
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in self.value += 1 }
    }
}






//
//NavigationView {
//    NavigationLink(
//        destination: Chapter2(),
//        label: {
//            HStack() {
//                Spacer()
//                Spacer()
//                Text("Next Chapter: 1")
//                    .foregroundColor(.blue)
//                Spacer()
//                ProgressBar(progressPercentBar)
//                    .frame(width: 130, height: 130)
//            }
//        })
//}







//ZStack {
//
//    ThinkingView()
//        .animation(Animation.easeInOut(duration: 2.0).delay(4.0))
//        .frame(width: 650, height: 650)
//        .onAppear {
//            Text("djkslahjsahjkfhjkshfjks")
//                .foregroundColor(.white)
//                .animation(Animation.easeInOut(duration: 2.0).delay(4.0))
//        }
//}
