//
//  QuestionViewController.swift
//  QuestionsAnswers
//
//  Created by Kinki Lai on 2017/3/7.
//  Copyright © 2017年 Kinki Lai. All rights reserved.
//

import UIKit
import AVFoundation
var name=""
var random=0
class QuestionViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func play(_ sender: Any)
    {
        name=examQuestions[random].question
        playMP3()
        player.play()
        print(examQuestions[random].question)
    }
    @IBAction func pause(_ sender: Any)
    {
        player.pause()
    }
    @IBAction func replay(_ sender: Any)
    {
        player.stop()
        player.play()
    }
    
    
    
    struct QuestionAnswer{
        var view:String
        var question:String
        var choose:[String]=[]
        var answer:Int
    }
    
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var ChooseButtons: [UIButton]!
    
    @IBOutlet weak var A: UIImageView!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var topic: UILabel!
    var examQuestions:[QuestionAnswer]=[]
    var list:[Int]=[]
    var score=0
    var answser:Int=0;
    var questionCount=0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

  

        setExamData()
        
        print(String(random)+"  1  12112")
        nextQuestion()
       // A.image=UIImage(named:examQuestions[random].view)
        // Do any additional setup after loading the view.
 
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func ChooseAction(_ sender: UIButton) {
        //let index=sender.currentTitle?.startIndex
        let userChooser=sender.tag
        print(userChooser)
        print(answser)
        if(userChooser==answser)
        {
            score=score+10
            scoreLabel.text="score:\(score)";
        }
         checkGame()
        player.pause()
        print(examQuestions[random].question)
        print(String(random)+"    12112")
        
    }
    
    @IBAction func nextQuestionAction(_ sender: Any) {
        checkGame()
        player.pause()
    }
    
    @IBAction func restartAction(_ sender: Any) {
        
        setExamData()
        nextQuestion()
        player.pause()
        
    }
    func setExamData()
        
    {
        
        examQuestions.append(QuestionAnswer(view:"Taylor Swift.jpg",question:"taylor swift - blank space",choose:[" Love story"," 22"," Red"," Blank space"],answer:4))
        examQuestions.append(QuestionAnswer(view:"sia.jpg",question:"Sia - Chandelier",choose:[" The Greatest"," Chandelier"," I'm Still Here"," Cheap Thrills"],answer:2))
        examQuestions.append(QuestionAnswer(view:"OneRepublic.jpg",question:"OneRepublic - Good Life (mp3cut.net)",choose:["All We Are"," Good Life"," Apologize"," Counting Stars"],answer:2))
        examQuestions.append(QuestionAnswer(view:"MP魔幻力量.jpg",question:"MP魔幻力量 - 我還是愛著你",choose:[" 我是誰我是誰我是誰"," 我還是愛著你"," 射手"," 偷偷的"],answer:2))
        examQuestions.append(QuestionAnswer(view:"電玩.jpg",question:"Maplestory",choose:[" 楓之谷的音樂"," 仙境傳說的音樂"," 魔獸世界的音樂"," 寶可夢的音樂"],answer:1))
        examQuestions.append(QuestionAnswer(view:"迪士尼.jpg",question:"Frozen - Let It Go",choose:[" 魔髮奇緣的 See The Light"," 仙履奇緣的 Lavender's Blue"," 海洋奇緣的 How Far I’ll Go!"," 冰雪奇緣的 Let It Go"],answer:4))
        examQuestions.append(QuestionAnswer(view:"蘇打綠.jpg",question:"蘇打綠 - 小情歌",choose:[" 這天"," 狂熱"," 小情歌"," 小宇宙"],answer:3))
        examQuestions.append(QuestionAnswer(view:"魏如昀.jpg",question:"魏如昀 - 聽見下雨的聲音",choose:[" 而我聽見"," 聽見下雨的聲音"," 幸福也可以"," 很靠近"],answer:2))
        examQuestions.append(QuestionAnswer(view:"鄧紫棋.jpg",question:"鄧紫棋 - 倒數",choose:[" 倒帶"," 倒退"," 倒數"," 倒立"],answer:3))
        examQuestions.append(QuestionAnswer(view:"棉花糖.jpg",question:"棉花糖 - 欠一個勇敢",choose:[" 欠一個勇敢"," 努力去闖"," 口袋的天空"," 無與倫比的美麗"],answer:1))
        examQuestions.append(QuestionAnswer(view:"孫燕姿.jpg",question:"孫燕姿 - 第一天",choose:[" 我不難過"," 天黑黑"," 第一天"," 我懷念的"],answer:3))
        examQuestions.append(QuestionAnswer(view:"夏婉安.jpg",question:"夏婉安 - 習慣",choose:[" 不愛我就拉倒"," 習慣"," k歌之王"," 男人ktv"],answer:2))
        examQuestions.append(QuestionAnswer(view:"苏运莹.jpg",question:"苏运莹 - 野子",choose:[" 野子"," 野外"," 野口"," 野生的寶可夢"],answer:1))
        examQuestions.append(QuestionAnswer(view:"林俊傑.jpg",question:"林俊傑 - 不為誰而作的歌",choose:[" 不太懂的歌"," 不知所措的歌"," 不為你作的歌"," 不為誰而作的歌"],answer:4))
        examQuestions.append(QuestionAnswer(view:"周湯豪.jpg",question:"周湯豪 - 帥到分手",choose:[" 帥到分手"," 摔到分手"," 我才沒有分手"," 沒有女友怎麼分手"],answer:1))
        examQuestions.append(QuestionAnswer(view:"周杰倫.jpg",question:"周杰倫 - 晴天",choose:[" 雨天"," 彩虹"," 晴天"," 陰天"],answer:3))
        examQuestions.append(QuestionAnswer(view:"吳汶芳.jpg",question:"吳汶芳 - 孤獨的總和",choose:[" 孤獨的總和"," 寂寞的平行線"," 曖昧的相加"," 失戀的最佳解"],answer:1))
        examQuestions.append(QuestionAnswer(view:"動漫.jpg",question:"火影忍者",choose:[" 死神的主題曲"," 火影忍者的主題曲"," 航海王的主題曲"," 結界師的主題曲"],answer:2))
        examQuestions.append(QuestionAnswer(view:"五月天.jpg",question:"五月天 - 天使",choose:[" 垃圾車"," 天使"," 突然好想你"," 私奔到月球"],answer:2))
        examQuestions.append(QuestionAnswer(view:"久石壤.jpg",question:"久石壤 - Kaeru Hi",choose:[" 霍爾的移動城堡插曲"," 天空之城的插曲"," 神隱少女的插曲"," 魔女宅急便的插曲"],answer:3))
        score=0
        questionCount=0
        scoreLabel.text="score:\(score)";
        list=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
    }
    
    func playMP3()
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: name, ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
            //ERROR
        }
    }
    
    
    func nextQuestion()
        
    {
        questionCount=questionCount+1
        
        random=Int(arc4random()) % list.count
       // let index=list[random] //rundom
 
        for i in 0 ..< ChooseButtons.count{
            ChooseButtons[i].setTitle("\(i+1)\(examQuestions[random].choose[i])", for: UIControlState.normal)
        }
        list.remove(at: random) //rrrr
        topic.text=String(questionCount)
        questionImageView.image=UIImage(named: examQuestions[random].question)
        answser=examQuestions[random].answer
         A.image=UIImage(named:examQuestions[random].view)
        
    }
    func checkGame()
    {
        if(questionCount==10)
        {
            let alertController = UIAlertController(title: "猜題結束", message: "分數\(score)", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(
                title: "確認",
                style: .default,
                handler: {
                    action in self.setExamData()
            }
            )
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
            setExamData()
            nextQuestion()
        }
        else
        {
            nextQuestion()
        }
      print(examQuestions[random].question)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
