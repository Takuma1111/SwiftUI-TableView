//
//  ContentView.swift
//  SwiftUITableView
//
//  Created by 村上拓麻 on 2020/09/16.
//  Copyright © 2020 村上拓麻. All rights reserved.
//

import SwiftUI

//画像情報を設定する構造体
struct Player : Identifiable{ //Identifiableとはidという変数を持っていることを示すプロトコル
    var id:Int
    let name:String
    let image: Image
}

struct ContentView: View {
    
    //名前と画像名を追加
    let players : [[Player]] = [ //多次元配列
        [.init(id: 0 ,name: "Python", image: Image("kisspng-angle-text-symbol-brand-other-python-5ab0c09b9ea1a7.3286927515215330836498")),
         .init(id:1,name: "C#", image: Image("kisspng-c-programming-language-logo-microsoft-visual-stud-atlas-portfolio-5b899192d7c600.1628571115357423548838")),
         .init(id:2,name: "JavaScript", image: Image("kisspng-javascript-programmer-programming-language-compute-node-js-5b35fcbd143445.0682463015302647650828")),
         .init(id:1,name: "C#", image: Image("kisspng-c-programming-language-logo-microsoft-visual-stud-atlas-portfolio-5b899192d7c600.1628571115357423548838")),
         .init(id:2,name: "JavaScript", image: Image("kisspng-javascript-programmer-programming-language-compute-node-js-5b35fcbd143445.0682463015302647650828"))
        ],
        [.init(id: 0 ,name: "Python", image: Image("kisspng-angle-text-symbol-brand-other-python-5ab0c09b9ea1a7.3286927515215330836498")),
         .init(id:1,name: "C#", image: Image("kisspng-c-programming-language-logo-microsoft-visual-stud-atlas-portfolio-5b899192d7c600.1628571115357423548838")),
         .init(id:2,name: "JavaScript", image: Image("kisspng-javascript-programmer-programming-language-compute-node-js-5b35fcbd143445.0682463015302647650828")),
         .init(id:1,name: "C#", image: Image("kisspng-c-programming-language-logo-microsoft-visual-stud-atlas-portfolio-5b899192d7c600.1628571115357423548838")),
         .init(id:2,name: "JavaScript", image: Image("kisspng-javascript-programmer-programming-language-compute-node-js-5b35fcbd143445.0682463015302647650828"))
        ],
        [.init(id: 0 ,name: "Python", image: Image("kisspng-angle-text-symbol-brand-other-python-5ab0c09b9ea1a7.3286927515215330836498")),
         .init(id:1,name: "C#", image: Image("kisspng-c-programming-language-logo-microsoft-visual-stud-atlas-portfolio-5b899192d7c600.1628571115357423548838")),
         .init(id:2,name: "JavaScript", image: Image("kisspng-javascript-programmer-programming-language-compute-node-js-5b35fcbd143445.0682463015302647650828")),
         .init(id:1,name: "C#", image: Image("kisspng-c-programming-language-logo-microsoft-visual-stud-atlas-portfolio-5b899192d7c600.1628571115357423548838")),
         .init(id:2,name: "JavaScript", image: Image("kisspng-javascript-programmer-programming-language-compute-node-js-5b35fcbd143445.0682463015302647650828"))
        ]
        
    ]
    
    var body: some View {
        NavigationView{
            List{
                //ループする回数を指定
                ForEach(players.startIndex...(players.endIndex - 1), id: \.self){
                    section in
                    Section(header: Text(self.switchHeaderTitle(section: section))   //セクション分けし、idを元にタイトルを設定
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                    ){
                        ForEach(self.players[section]){ player in
                            HStack{
                                player.image
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())    //画像を丸くする
                                    .frame(width: 50, height: 50)   //画像サイズを指定
                                Text(player.name)
                                    .font(.headline)
                                    .padding(.leading, 20)  //画像と文字の間を空ける
                            }
                        }
                    }.frame(height: 70) //セクションの高さを調整
                }
            }.navigationBarTitle(Text("プログラミング言語"))
        }
    }
    
    //番地を取得し、Sectioに設定する名前を返す
    func switchHeaderTitle(section: Int) -> String{
        switch section {
        case 0:
            return "面白い言語"
        case 1:
            return "楽しい言語"
        case 2:
            return "難しい言語"
        default:
            return ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
