




import Foundation
import SwiftUI
import AVFoundation











//MARK: - Chapter 2:

public struct Chapter2: View {
    @State var progressPercentBar: Double = 0.12
    
    @State var toSay = "a big shape near the moon, different from meteorites. The ufo comes closer to the earth and start dividing in smaller space ship"
    
    public func speak() {
        let voice = AVSpeechSynthesisVoice(language: "en-en")
        let tosay = AVSpeechUtterance(string: toSay)
        tosay.voice = voice
        let spk = AVSpeechSynthesizer()
        spk.speak(tosay)
    }
    
    public var body: some View {
        
        VStack {
            ThinkingView2()
                .frame(width: 200, height: 200)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        speak()
                    }
                }
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: Chapter3(),
                        label: {
                            HStack() {
                                Spacer()
                                Spacer()
                                Text("Next Chapter: 3")
                                Spacer()
                                ProgressBar(progressPercentBar)
                                    .frame(width: 130, height: 130)
                            }
                        })
                }
            }
           
        

    }



    //MARK: - animation image test


    struct ThinkingView2: View {
        
        @State private var myImage = Image(uiImage: UIImage(named: "k1.png")!)
        @State private var count = 0
        private let timer = Timer.publish(every: 1.4, on: .main, in: .common).autoconnect()
        
        let imageNames: [String] = ["k1.png", "k2.png", "k3.png", "k4.png", "k5.png"]
        
        
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







////MARK: - Chapter 3:
//
//struct Chapter3: View {
//
//    @State var progressPercentBar: Double = 1
//
//    var body: some View {
//
//        VStack {
//            Spacer()
//            CircleNumberView(color: .green, number: 3)
//                .navigationTitle("green view")
//                .offset(y: -60)
//            Spacer()
//            NavigationLink(
//                destination: Text("Destination"),
//                label: {
//                    HStack() {
//                        Spacer()
//                        Spacer()
//                        Text("Next Chapter: 3")
//                        Spacer()
//                        ProgressBar(progressPercentBar)
//                            .frame(width: 130, height: 130)
//                    }
//
//                })
//        }
//    }
//}
















