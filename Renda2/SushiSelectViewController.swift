//
//  SushiSelectViewController.swift
//  Renda2
//
//  Created by SeinaKonishi on 2022/02/18.
//

import UIKit
import AVFoundation

class SushiSelectViewController: UIViewController {
    
    //ネタを表示させるラベルを宣言
    @IBOutlet var netaLabel: UILabel!
    
    //ボタンを宣言
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
    
    //乱数を入れるnumberを宣言
    var number: Int = 0
    
    //bgmと声それぞれのAVAudioPlayerを宣言
    var bgmPlayer: AVAudioPlayer!
    var voicePlayer: AVAudioPlayer!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //ボタンのテキストをなくす
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
        
        //ボタンを消す
        buriButton.isHidden = true
        ebiButton.isHidden = true
        harasuButton.isHidden = true
        hotateButton.isHidden = true
        katsuoButton.isHidden = true
        kingsamonButton.isHidden = true
        maguroButton.isHidden = true
        otoroButton.isHidden = true
        samonButton.isHidden = true
        taiButton.isHidden = true
        tyutoroButton.isHidden = true
        
        //BGMを流す
        let soundURL = URL(fileURLWithPath:Bundle.main.path(forResource: "sushikuine", ofType: "mp3")!)
            do {
                // ループ再生する
                bgmPlayer = try AVAudioPlayer(contentsOf: soundURL)
                bgmPlayer?.numberOfLoops = -1
              
                // 即時再生させる
                bgmPlayer?.prepareToPlay()
                
                // BGMを鳴らす
                bgmPlayer?.play()
                
                //音量を半減
                bgmPlayer.volume = 0.5
               
            } catch {
                print("error...")
            }

        // Do any additional setup after loading the view.
    }
    
    //各ボタンが押された時の指示(押されたボタンが消える機能&ネタシャッフルメソッド、引数がnetaにネタ、soundNameにネタ+ボイス)
    @IBAction func buriButtonTap(){
        buriButton.isHidden = true
        netashuffle(neta: "ぶりぶりのぶり",soundName: "burivoice")
    }
    @IBAction func ebiButtonTap(){
        ebiButton.isHidden = true
        netashuffle(neta: "ぷりぷりのえび", soundName: "ebivoice")
    }
    
    @IBAction func engawaButtonTap(){
        engawaButton.isHidden = true
        netashuffle(neta: "ぽかぽかじゃない方のえんがわ", soundName: "burivoice")
    }
    
    @IBAction func harasuButtonTap(){
        harasuButton.isHidden = true
        netashuffle(neta: "この脂乗りにハラハラハラス", soundName: "harasuvoice")
    }
    
    @IBAction func hotateButtonTap(){
        hotateButton.isHidden = true
        netashuffle(neta: "貝の王様ホタテ", soundName: "harasuvoice")
    }
    
    @IBAction func ikaButtonTap(){
        ikaButton.isHidden = true
        netashuffle(neta: "イカのお寿司って聞き覚えすごい", soundName: "harasuvoice")
    }
    
    @IBAction func katsuoButtonTap(){
        katsuoButton.isHidden = true
        netashuffle(neta: "まちなさーい！カツオー！", soundName: "katsuovoice")
    }
    
    @IBAction func kingsamonButtonTap(){
        kingsamonButton.isHidden = true
        netashuffle(neta: "King & Samon", soundName: "kingsamonvoice")
    }
    
    @IBAction func maguroButtonTap(){
        maguroButton.isHidden = true
        netashuffle(neta: "ジューシーマグロ", soundName: "magurovoice")
    }
    
    @IBAction func otoroButtonTap(){
        otoroButton.isHidden = true
        netashuffle(neta: "脂の洪水大トロ", soundName: "otorovoice")
    }
    
    @IBAction func samonButtonTap(){
        samonButton.isHidden = true
        netashuffle(neta: "キングじゃないサーモン", soundName: "samonvoice")
    }
    
    @IBAction func taiButtonTap(){
        taiButton.isHidden = true
        netashuffle(neta: "たいの美味しさに太鼓判", soundName: "taivoice")
    }
    
    @IBAction func tamagoButtonTap(){
        tamagoButton.isHidden = true
        netashuffle(neta: "あ、おいしいたまご", soundName: "tamagovoice")
    }
    
    @IBAction func tyutoroButtonTap(){
        tyutoroButton.isHidden = true
        netashuffle(neta: "中っていうけど上等中とろ", soundName: "tyutorovoice")
    }
    
    //ネタが流れる&次のやつが光る
    func netashuffle(neta:String,soundName:String){
        
        //ボイスのURLを発行
        let voiceName = URL(fileURLWithPath:Bundle.main.path(forResource: soundName, ofType: "m4a")!)
        
        //ボイスの再生
        voicePlayer = try? AVAudioPlayer(contentsOf: voiceName)
        voicePlayer.play()
        
        //ネタをラベルに貼る
        netaLabel.text = neta
        
        //乱数の生成
        number = Int.random(in: 0...15)
        
        //13だったらスシローのサイトを、14なら+81を、15なら君青のサイト見せてからボタン光らせる
        if number == 13{
            
            let url = NSURL(string: "https://www.akindo-sushiro.co.jp/")
            if UIApplication.shared.canOpenURL(url! as URL){
                UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)}
            
        }else if number == 14{
            
            bgmPlayer.stop()
            let url = NSURL(string: "https://youtu.be/OLVr1fqNZK4")
            if UIApplication.shared.canOpenURL(url! as URL){
                UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)}
            
        }else if number == 15{
            
            let url = NSURL(string: "https://happinet-phantom.com/kimiao/")
            if UIApplication.shared.canOpenURL(url! as URL){
                UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)}
            
        }else{
        
        //乱数によって次に光るボタンを決める
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
        default:
            tamagoButton.isHidden = false
        }
        }
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
