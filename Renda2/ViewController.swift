//
//  ViewController.swift
//  Renda2
//
//  Created by SeinaKonishi on 2022/02/14.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var netaLabel: UILabel!
    
    @IBOutlet var buriButton: UIButton!
    @IBOutlet var ebiButton: UIButton!
    @IBOutlet var engawaButton: UIButton!
    @IBOutlet var harasuButton: UIButton!
    @IBOutlet var hotateButton: UIButton!
    @IBOutlet var ikaButton: UIButton!
    @IBOutlet var katsuoButton: UIButton!
    @IBOutlet var kingsamonButton: UIButton!
    @IBOutlet var maguroButton: UIButton!
    @IBOutlet var otoroButton: UIButton!
    @IBOutlet var samonButton: UIButton!
    @IBOutlet var taiButton: UIButton!
    @IBOutlet var tamagoButton: UIButton!
    @IBOutlet var tyutoroButton: UIButton!
    
    var number: Int = 0
    var truck: Int = 0
    var audioPlayer: AVAudioPlayer!
    var audioPlayer2: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buriButton.setTitle("", for: .normal)
        ebiButton.setTitle("", for: .normal)
        engawaButton.setTitle("", for: .normal)
        harasuButton.setTitle("", for: .normal)
        hotateButton.setTitle("", for: .normal)
        ikaButton.setTitle("", for: .normal)
        katsuoButton.setTitle("", for: .normal)
        kingsamonButton.setTitle("", for: .normal)
        maguroButton.setTitle("", for: .normal)
        otoroButton.setTitle("", for: .normal)
        samonButton.setTitle("", for: .normal)
        taiButton.setTitle("", for: .normal)
        tamagoButton.setTitle("", for: .normal)
        tyutoroButton.setTitle("", for: .normal)
        
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
        
        let beforenumber = number
        number = Int.random(in: 1...16)
        
        switch beforenumber{
        case 1:
            buriButton.isHidden = true
            sushiChange(neta: "ぶりぶりのぶり", img: "buri", soundName: "burivoice")
        case 2:
            ebiButton.isHidden = true
            sushiChange(neta: "ぷりぷりのえび", img: "ebi", soundName: "ebivoice")
        case 3:
            harasuButton.isHidden = true
            sushiChange(neta: "焼いてもおいしいハラス", img: "harasu", soundName: "harasuvoice")
        case 4:
            hotateButton.isHidden = true
            sushiChange(neta: "貝の王様ホタテ", img: "hotate", soundName: "hotatevoice")
        case 5:
            katsuoButton.isHidden = true
            sushiChange(neta: "脂がいい感じかつお", img: "katsuo", soundName: "katsuovoice")
        case 6:
            kingsamonButton.isHidden = true
            sushiChange(neta: "王様キングサーモン", img: "kingsamon", soundName: "kingsamonvoice")
        case 7:
            maguroButton.isHidden = true
            sushiChange(neta: "ジューシーマグロ", img: "maguro", soundName: "magurovoice")
        case 8:
            otoroButton.isHidden = true
            sushiChange(neta: "脂の洪水大トロ", img: "otoro", soundName: "otorovoice")
        case 9:
            samonButton.isHidden = true
            sushiChange(neta: "みんな大好きサーモン", img: "samon", soundName: "samonvoice")
        case 10:
            taiButton.isHidden = true
            sushiChange(neta: "フライも美味しいよねたい", img: "tai", soundName: "taivoice")
        case 11:
            tyutoroButton.isHidden = true
            sushiChange(neta: "いい感じの脂中トロ", img: "tyutoro", soundName: "tyutorovoice")
        case 12:
            tyutoroButton.isHidden = true
        case 13:
            kingsamonButton.isHidden = true
        case 14:
            katsuoButton.isHidden = true
            audioPlayer.play()
        default:
            tamagoButton.isHidden = true
        }
        
        switch number{
        case 1:
            buriButton.isHidden = false
        case 2:
            ebiButton.isHidden = false
        case 3:
            harasuButton.isHidden = false
        case 4:
            hotateButton.isHidden = false
        case 5:
            katsuoButton.isHidden = false
        case 6:
            kingsamonButton.isHidden = false
        case 7:
            maguroButton.isHidden = false
        case 8:
            otoroButton.isHidden = false
        case 9:
            samonButton.isHidden = false
        case 10:
            taiButton.isHidden = false
        case 11:
            tyutoroButton.isHidden = false
        case 12:
            let url = NSURL(string: "https://www.akindo-sushiro.co.jp/")
            if UIApplication.shared.canOpenURL(url! as URL){
                UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)}
            tyutoroButton.isHidden = false
            
        case 13:
            let url = NSURL(string: "https://happinet-phantom.com/kimiao/")
            if UIApplication.shared.canOpenURL(url! as URL){
                UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)}
            kingsamonButton.isHidden = false
            
        case 14:
            audioPlayer.stop()
            let url = NSURL(string: "https://youtu.be/OLVr1fqNZK4")
            if UIApplication.shared.canOpenURL(url! as URL){
                UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)}
            katsuoButton.isHidden = false
            
        default:
            sushiChange(neta: "あ、おいしいたまご", img: "tamago", soundName: "tamagovoice")
        }
    }
    
    func sushiChange(neta:String, img:String, soundName:String){
        
        let imgToAudio = URL(fileURLWithPath:Bundle.main.path(forResource: soundName, ofType: "m4a")!)
        audioPlayer2 = try? AVAudioPlayer(contentsOf: imgToAudio)
        audioPlayer2.play()

        netaLabel.text = neta
        
    }
    



}

