//
//  ViewController.swift
//  Renda2
//
//  Created by SeinaKonishi on 2022/02/14.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var sushiButton: UIButton!
    
    var number: Int = 0
    var audioPlayer: AVAudioPlayer!
    var audioPlayer2: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let soundURL = URL(fileURLWithPath:Bundle.main.path(forResource: "sushikuine", ofType: "mp3")!)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = -1   // ループ再生する
                audioPlayer?.prepareToPlay()      // 即時再生させる
                audioPlayer?.play()               // BGMを鳴らす
            } catch {
                print("error...")
            }
        
    }
    
    @IBAction func addButton(){
        
        if number < 12{
        
            number = number + 1
        
        }else{
            
            number = 0
            
        }
        
        switch number{
        case 1:
            sushiChange(neta: "ぶりぶりのぶり", img: "buri", soundName: "burivoice")
        case 2:
            sushiChange(neta: "ぷりぷりのえび", img: "ebi", soundName: "ebivoice")
        case 3:
            sushiChange(neta: "焼いてもおいしいハラス", img: "harasu", soundName: "harasuvoice")
        case 4:
            sushiChange(neta: "貝の王様ホタテ", img: "hotate", soundName: "hotatevoice")
        case 5:
            sushiChange(neta: "脂がいい感じかつお", img: "katsuo", soundName: "katsuovoice")
        case 6:
            sushiChange(neta: "王様キングサーモン", img: "kingsamon", soundName: "kingsamonvoice")
        case 7:
            sushiChange(neta: "ジューシーマグロ", img: "maguro", soundName: "magurovoice")
        case 8:
            sushiChange(neta: "脂の洪水大トロ", img: "otoro", soundName: "otorovoice")
        case 9:
            sushiChange(neta: "みんな大好きサーモン", img: "samon", soundName: "samonvoice")
        case 10:
            sushiChange(neta: "フライも美味しいよねたい", img: "tai", soundName: "taivoice")
        case 11:
            sushiChange(neta: "いい感じの脂中トロ", img: "tyutoro", soundName: "tyutorovoice")
        case 12:
            let url = NSURL(string: "https://www.akindo-sushiro.co.jp/")
            if UIApplication.shared.canOpenURL(url! as URL){
                UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
            }
            
        default:
            sushiChange(neta: "あ、おいしいたまご", img: "tamago", soundName: "tamagovoice")
            
        }
        
    }
    
    func sushiChange(neta:String, img:String, soundName:String){
        
        let image = UIImage(named: img)
        let state = UIControl.State.normal
        sushiButton.setImage(image, for: state)
        
        let imgToAudio = URL(fileURLWithPath:Bundle.main.path(forResource: soundName, ofType: "m4a")!)
        audioPlayer2 = try? AVAudioPlayer(contentsOf: imgToAudio)
        audioPlayer2.play()

        numberLabel.text = neta
        
    }
    



}

