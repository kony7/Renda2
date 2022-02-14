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
            sushiChange(neta: "ぶりぶりのぶり", img: "buri")
        case 2:
            sushiChange(neta: "ぷりぷりのえび", img: "ebi")
        case 3:
            sushiChange(neta: "焼いてもおいしいハラス", img: "harasu")
        case 4:
            sushiChange(neta: "貝の王様ホタテ", img: "hotate")
        case 5:
            sushiChange(neta: "脂がいい感じかつお", img: "katsuo")
        case 6:
            sushiChange(neta: "王様キングサーモン", img: "kingsamon")
        case 7:
            sushiChange(neta: "ジューシーマグロ", img: "maguro")
        case 8:
            sushiChange(neta: "脂の洪水大トロ", img: "otoro")
        case 9:
            sushiChange(neta: "みんな大好きサーモン", img: "samon")
        case 10:
            sushiChange(neta: "フライも美味しいよねたい", img: "tai")
        case 11:
            sushiChange(neta: "いい感じの脂中トロ", img: "tyutoro")
        case 12:
            let url = NSURL(string: "https://www.akindo-sushiro.co.jp/")
            if UIApplication.shared.canOpenURL(url! as URL){
                UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
            }
            
        default:
            sushiChange(neta: "あ、おいしいたまご", img: "tamago")
            
        }
        
    }
    
    func sushiChange(neta:String, img:String){
        
        let image = UIImage(named: img)
        let state = UIControl.State.normal
        sushiButton.setImage(image, for: state)
        
        let imgToAudio = URL(fileURLWithPath:Bundle.main.path(forResource: img, ofType: "m4a")!)
        audioPlayer = try! AVAudioPlayer(contentsOf: imgToAudio)
        audioPlayer.play()
        
        numberLabel.text = neta
        
    }
    



}

